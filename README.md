# steamfetch-action

This action is a wrapper for DepotDownloader which is used to download files from Steam.

## Usage
Basic:
```yml
steps:
  - uses: "Skippeh/steamfetch-action@v0.1.0-alpha"
    with:
      username: "${{ secrets.STEAM_USER }}"
      password: "${{ secrets.STEAM_PASS }}"
      dir: "${{ github.workspace }}/game_files/"
      os: "windows"
      app: 420
      osarch: 32
      files: "hl2.exe"
```

Multiple files including regex:
```yml
steps:
  - uses: "Skippeh/steamfetch-action@v0.1.0-alpha"
    with:
      username: "${{ secrets.STEAM_USER }}"
      password: "${{ secrets.STEAM_PASS }}"
      dir: "${{ github.workspace }}/game_files/"
      os: "windows"
      app: 420
      osarch: 32
      files: |
        hl2.exe
        regex:^hl2\/bin\/.+
```

## Inputs
### dir
<sub>required</sub>

The directory in which to place the downloaded files.

### os
<sub>required</sub>

<sub>Values: ```windows```, ```macos```, ```linux```

Decides which version of the game is downloaded.

### app
<sub>required</sub>

The id of the application to download.

### osarch
<sub>required</sub>

<sub>Values: ```32```, ```64```</sub>

Target OS architecture to download.

### username
<sub>default: *none*</sub>

Optionally provide Steam account username. If unspecified then we'll log in anonymously.

### password
<sub>default: *none*</sub>

Optionally provide Steam account password. If unspecified then we'll log in anonymously.

### files
<sub>default: *none*</sub>

Optionally provide an array of files to download. If unspecified all files will be downloaded.

### beta
<sub>default: ```Public```</sub>

Optionally specify which beta branch to download.

### beta-password
<sub>default: *none*</sub>

Optionally specify a password for the beta branch.

### loginid
<sub>default: *none*</sub>

Optionally specify a unique login 32bit integer. Required if running multiple instances of this action concurrently, or if you don't want steam friends to get signed out when using a personal account.

### language
<sub>default: ```english```</sub>

Optionally specify a language.

### max-downloads
<sub>default: ```8```

Optionally specify maximum numbers of chunks to download concurrently.

### max-servers
<sub>default: ```20````</sub>

Optionally specify maximm number of content servers to use.

### cellid
<sub>default: *none*</sub>

Optionally override the cell id of the content server to download from.

### pubfile
<sub>default: *none*</sub>

Optionally specify the published file id to download (will automatically resolve to UGC id). Used for downloading from the workshop.

### ugc
<sub>default: *none*</sub>

Optionally specify the UGC id to download. Used for downloading from the workshop.

### manifest
<sub>default: *none*</sub>

Optionally specify which manifest id to download. Requires depot to be specified.

### depot
<sub>default: *none*</sub>

Optionally specify the depot id to download. Required if downloading a specific manifest.

### keep-depotdownloader
<sub>default: ```false```</sub>

If true then the .DepotDownloader folder will not be deleted from the out directory.

## Outputs
None