#!/bin/bash
curl -s $1 | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*"
