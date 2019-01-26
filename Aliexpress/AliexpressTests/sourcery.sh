#!/bin/sh
BASE_DIRECTORY="Aliexpress"

mkdir -p ${BASE_DIRECTORY}Tests/Generated/

./../Pods/Sourcery/bin/sourcery \
--sources $BASE_DIRECTORY \
--templates ./SourceryTemplates/AutoMockable.stencil \
--output ${BASE_DIRECTORY}Tests/Generated/Mocks.swift \
--args module=$BASE_DIRECTORY
