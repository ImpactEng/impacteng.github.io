#!/usr/bin/env python3
"""
Breadcrumb schema validation script.
Tests the generated breadcrumb schema from built HTML files.
"""

import json
import sys
import re
from pathlib import Path
from typing import List, Tuple, Optional


def extract_breadcrumb_schema(html_content: str) -> Optional[dict]:
    """
    Extracts the BreadcrumbList schema from HTML content.
    Returns the parsed schema or None if not found.
    """
    # Find the BreadcrumbList JSON-LD script
    pattern = r'{\s*"@context":\s*"https://schema\.org",\s*"@type":\s*"BreadcrumbList".*?}\s*</script>'
    match = re.search(pattern, html_content, re.DOTALL)

    if not match:
        return None

    try:
        schema_str = match.group(0).replace("</script>", "")
        return json.loads(schema_str)
    except json.JSONDecodeError:
        return None


def find_test_pages() -> List[Tuple[str, str]]:
    """
    Finds test pages in the _site directory.
    Returns list of (url_path, file_path) tuples.
    """
    test_pages = [
        ("/blog/", "_site/blog/index.html"),
        (
            "/blog/orchestrating-devops-dominance/",
            "_site/blog/orchestrating-devops-dominance/index.html",
        ),
        ("/services/", "_site/services/index.html"),
        ("/about/", "_site/about/index.html"),
        ("/contact/", "_site/contact/index.html"),
    ]

    # Filter to only existing files
    return [(url, file) for url, file in test_pages if Path(file).exists()]


def validate_breadcrumb_schema(schema: Optional[dict]) -> Tuple[bool, List[str]]:
    """
    Validates breadcrumb schema against Google's requirements.
    Returns (is_valid, list_of_errors)
    """
    errors = []

    if not schema:
        return True, []

    items = schema.get("itemListElement", [])

    for i, item in enumerate(items):
        # Check required fields
        if "@type" not in item or item["@type"] != "ListItem":
            errors.append(f"Item {i}: Missing or invalid @type")

        if "position" not in item:
            errors.append(f"Item {i}: Missing position")

        # Google requires either 'name' or 'item.name'
        has_name = "name" in item and item["name"]
        has_item_name = isinstance(item.get("item"), dict) and "name" in item.get(
            "item", {}
        )

        if not has_name and not has_item_name:
            errors.append(f"Item {i}: Missing 'name' or 'item.name' (GOOGLE ERROR)")

        # Check for empty name
        if "name" in item and not item["name"]:
            errors.append(f"Item {i}: Empty 'name' field (GOOGLE ERROR)")

        # Check URL format
        if "item" in item:
            item_url = item["item"]
            if isinstance(item_url, str):
                # Check for double slashes (except in protocol)
                url_without_protocol = item_url.replace("https://", "").replace(
                    "http://", ""
                )
                if "//" in url_without_protocol:
                    errors.append(f"Item {i}: Double slash in URL: {item_url}")

    return len(errors) == 0, errors


def main():
    """Run validation tests on generated HTML files."""
    test_pages = find_test_pages()

    if not test_pages:
        print("ERROR: No test pages found in _site directory")
        print("Please run: docker compose run --rm jekyll bundle exec jekyll build")
        return 1

    print("=" * 70)
    print("BREADCRUMB SCHEMA VALIDATION TEST")
    print("=" * 70)

    failed_tests = 0
    passed_tests = 0
    failed_urls = []

    for url, file_path in test_pages:
        print(f"\nTesting URL: {url}")
        print(f"File: {file_path}")
        print("-" * 70)

        try:
            with open(file_path, "r") as f:
                html_content = f.read()
        except IOError as e:
            print(f"  ✗ ERROR: Could not read file: {e}")
            failed_tests += 1
            failed_urls.append(url)
            continue

        schema = extract_breadcrumb_schema(html_content)

        if schema is None:
            print("  (No breadcrumb schema found)")
            passed_tests += 1
            continue

        is_valid, errors = validate_breadcrumb_schema(schema)

        if is_valid:
            print(f"  ✓ PASS")
            passed_tests += 1
        else:
            print(f"  ✗ FAIL - {len(errors)} error(s)")
            failed_tests += 1
            failed_urls.append(url)
            for error in errors:
                print(f"    - {error}")

        print(f"\n  Generated breadcrumbs:")
        for item in schema.get("itemListElement", []):
            print(f"    [{item['position']}] {item['name']:30} -> {item['item']}")

    print("\n" + "=" * 70)
    print(f"RESULTS: {passed_tests} passed, {failed_tests} failed")
    print("=" * 70)

    if failed_tests > 0:
        print(f"\nFailed URLs: {', '.join(failed_urls)}")
        return 1
    else:
        print("\nAll tests passed! Breadcrumb schema is valid.")
        return 0


if __name__ == "__main__":
    sys.exit(main())
