#!/bin/bash
set -e

echo "=== domain-curator-template bootstrap ==="
echo "1. cp config/domain-params.example.md config/domain-params.md"
echo "2. Edit config/domain-params.md with your domain/stack/goals/rubric"
echo "3. Append initial X posts to sources/x-posts.md using the documented format"
echo "4. Implement/extend 'make process' (see Makefile comments and pfy-mentat reference)"
echo "5. Run make process && make regenerate-catalog"
echo ""
echo "See README.md Quickstart and CATEGORIZATION.md for details."
chmod +x "$0" 2>/dev/null || true
