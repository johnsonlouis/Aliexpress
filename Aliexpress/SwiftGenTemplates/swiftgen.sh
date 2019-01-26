#!/bin/sh

BASE_DIRECTORY="Aliexpress"
GENERATED_DIRECTORY="$BASE_DIRECTORY/Generated"
RESSOURCES_DIRECTORY="$BASE_DIRECTORY/Ressources"

mkdir -p ${GENERATED_DIRECTORY}
mkdir -p ${RESSOURCES_DIRECTORY}

./Pods/SwiftGen/bin/swiftgen storyboards \
    -t scenes-swift4 $BASE_DIRECTORY \
    -o $GENERATED_DIRECTORY/Storyboards.swift \
    --param AppModule=Aliexpress
./Pods/SwiftGen/bin/swiftgen strings \
    -t structured-swift4 \
    $RESSOURCES_DIRECTORY/Aliexpress-localizable.strings \
    --output $GENERATED_DIRECTORY/GeneratedLocalizableStrings.swift
./Pods/SwiftGen/bin/swiftgen xcassets \
    -t swift4 \
    $RESSOURCES_DIRECTORY/Assets.xcassets \
    --output $GENERATED_DIRECTORY/GeneratedAssets.swift
