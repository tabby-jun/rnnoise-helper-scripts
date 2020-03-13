# rnnoise-helper-scripts 🔊🌊

These are some shell scripts that makes using `rnnoise` a little easier.

`rnnoise` is a tool that uses a recurrent neural network for audio noise reduction.

> 🔔 [`rnnoise` Github Repository](https://github.com/xiph/rnnoise)

## Cloning this project

```sh
git clone https://github.com/tabby-jun/rnnoise-helper-scripts.git
cd rnnoise-helper-scripts
git submodule init
git submodule update
```

If you prefer to use `ssh` for cloning, use `git@github.com:tabby-jun/rnnoise-helper-scripts.git` instead.

## Using the scripts

### Installing Prerequisites and build `rnnoise`

```sh
./apt-install-prereq-rnnnoise.sh
./build-rnnoise.sh
```

### Noise Reduction of a file using `rnnoise`

#### Mono Audio files

```sh
./rnnoise-mono-process-audio.sh <Audio File Path Here>
```

#### Stereo Audio Files

```sh
./rnnoise-stereo-process-audio.sh <Audio File Path Here>
```

## License

The scripts in this project is under the MIT License.

For the `rnnoise` project, which is included as a `git submodule` here, please refer to their BSD license over [[here]](https://github.com/xiph/rnnoise/blob/master/COPYING).