# steamfetch-action

This action is a wrapper for DepotDownloader which is used to download files from Steam.

## Usage
Basic:
```yml
steps:
  - uses: "Skippeh/steamfetch-action@v1"
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
  - uses: "Skippeh/steamfetch-action@v1"
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

| Name                 | Description                                                                                                                                                                     | Required    | Values                                  | Default     |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- | --------------------------------------- | ----------- |
| dir                  | The directory in which to place the downloaded files.                                                                                                                           | ```true```  |                                         |             |
| os                   | Decides which version of the game is downloaded.                                                                                                                                | ```true```  | ```windows```, ```linux```, ```macos``` |             |
| app                  | The id of the application to download.                                                                                                                                          | ```true```  |                                         |             |
| osarch               | Target OS architecture to download.                                                                                                                                             | ```true```  | ```32```, ```64```                      |             |
| username             | Steam account username. If unspecified then we'll log in anonymously.                                                                                                           | ```false``` |                                         |             |
| password             | Steam account password. If unspecified then we'll log in anonymously.                                                                                                           | ```false``` |                                         |             |
| files                | An array of files to download. If unspecified all files will be downloaded.                                                                                                     | ```false``` |                                         |             |
| beta                 | Which beta branch to download.                                                                                                                                                  | ```false``` |                                         |             |
| beta-password        | The password for the beta branch.                                                                                                                                               | ```false``` |                                         |             |
| loginid              | A unique 32bit integer. Required if running multiple instances of this action concurrently, or if you don't want steam friends to get signed out when using a personal account. | ```false``` |                                         |             |
| language             | The language to download.                                                                                                                                                       | ```false``` |                                         | english     |
| max-downloads        | Maximum number of chunks to download concurrently.                                                                                                                              | ```false``` |                                         | 8           |
| max-servers          | Maximum number of content servers to use.                                                                                                                                       | ```false``` |                                         | 20          |
| cellid               | Override the cell id of the content server to download from.                                                                                                                    | ```false``` |                                         |             |
| pubfile              | The published file id to download (will automatically resolve to UGC id). Used for downloading from the workshop.                                                               | ```false``` |                                         |             |
| ugc                  | The UGC id to download. Used for downloading from the workshop.                                                                                                                 | ```false``` |                                         |             |
| manifest             | The manifest id to download. Required depot to be specified.                                                                                                                    | ```false``` |                                         |             |
| depot                | The depot id to download. Required if downloading a specific manifest.                                                                                                          | ```false``` |                                         |             |
| keep-depotdownloader | If true then the .DepotDownloader folder will not be deleted from the out directory.                                                                                            | ```false``` |                                         | ```false``` |

## Outputs
None
