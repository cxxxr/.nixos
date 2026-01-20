#!/usr/bin/env bash
# Take a screenshot and save to a fixed path for Claude Code to read

OUTPUT_PATH="/tmp/claude-screenshot.png"

grim "$OUTPUT_PATH"

if [ $? -eq 0 ]; then
    echo "$OUTPUT_PATH"
else
    echo "Screenshot failed" >&2
    exit 1
fi
