# 이 파일은 scripts/update-formula.mjs 가 만든다 — 직접 고치지 말 것.
# 탭 저장소 JPWon-1/homebrew-tap 의 Formula/postq.rb 로 올라간다(.github/workflows/release.yml).
class Postq < Formula
  desc "Local API client (Postman-like) that runs in your browser"
  homepage "https://github.com/JPWon-1/postq"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.1/postq-0.1.1-darwin-arm64.tar.gz"
      sha256 "043513c853f02afda1e7641a8c4b6f7706993cc1a3951a37466d7fac102ff2f2"
    end
    on_intel do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.1/postq-0.1.1-darwin-x64.tar.gz"
      sha256 "a2db8f7999cd5d4ff655cd7e6d5c8c3d9e25428db7b994952f801feada3a8b2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.1/postq-0.1.1-linux-arm64.tar.gz"
      sha256 "b006c1f5541da0c5335d5f96c3d28aeea3c06a0d1fc7eeab5c2cce2799f6cabc"
    end
    on_intel do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.1/postq-0.1.1-linux-x64.tar.gz"
      sha256 "80af35932e4a5415266f9970fe22f0c59a469e3f24ea37a8ff790d9050cf2c11"
    end
  end

  def install
    bin.install "postq"
    # 실행 파일은 <prefix>/bin/../share/postq 에서 화면(ui)과 마이그레이션(drizzle)을 찾는다.
    pkgshare.install "ui", "drizzle"
  end

  def caveats
    <<~EOS
      Run `postq` to start it and open the browser (`postq --help` for options).
      Data (database and secret.key) lives in your user data folder, not in Homebrew's prefix;
      back up secret.key together with the database.
    EOS
  end

  test do
    assert_match "postq #{version}", shell_output("#{bin}/postq --version")
  end
end
