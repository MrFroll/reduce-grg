# reduce-grg

Reduce-GRG is a docker image with mathematical packages to make theoretical physics calculation (General Relativity and some post-Einstein theories). You can find it on my dockerhub page here [mrfroll/reduce-grg](https://hub.docker.com/repository/docker/mrfroll/reduce-grg) It consist of

- [REDUCE](https://reduce-algebra.sourceforge.io/) system for general mathematics calculation;
- [GRG 3.2](https://reduce-algebra.sourceforge.io/grg32/grg32.php) for calculation with physics abstractions in exterior form formalism.

To run REDUCE just execute in command-line to run `v0.1` of reduce-grg

```bash
docker run --rm -ti mrfroll/reduce-grg:v0.1 redpsl
```
