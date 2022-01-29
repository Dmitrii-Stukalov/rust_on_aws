LAMBDA_ARCH="linux/arch64"
RUST_TARGER="aarch-unknown-linux-gnu"
RUST_VERSION="latest"
PROJECT_NAME="rust_on_aws"

al2build() {
  docker run --platform ${LAMBDA_ARCH} \
    --rm --user "$(id -u)":"$(id -g)" \
    -v "${PWD}":/usr/src/myapp -w /usr/src/myapp rust:${RUST_VERSION} \
    cargo build --release --target ${RUST_TARGER}
}

zipRRustLambda() {
  cp ./target/${RUST_TARGER}/release/${PROJECT_NAME} ./bootstrap \
    && zip lambda.zip bootstrap \
    && rm bootstrap
}