# rnnoise-helper-scripts

> ⚡ Currently still a work in progress

These are some shell scripts that makes using `rnnoise` a little easier.

## Using the scripts

### Installing Prerequisites and build `rnnoise`

```sh
./apt-install-prereq-rnnnoise.sh
./build-rnnoise.sh
```

### Noise Reduction of a file using `rnnoise`

```sh
./rnnoise-mono-process-audio.sh <Audio File Path Here>
```

## License

The scripts in this project is under the MIT License.

For the `rnnoise` project, which is included as a `git submodule` here, please refer to their license over [[here]](https://github.com/xiph/rnnoise/blob/master/COPYING).