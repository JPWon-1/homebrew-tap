# 이 파일은 scripts/update-formula.mjs 가 만든다 — 직접 고치지 말 것.
# 탭 저장소 JPWon-1/homebrew-tap 의 Formula/postq.rb 로 올라간다(.github/workflows/release.yml).
class Postq < Formula
  desc "Local API client (Postman-like) that runs in your browser"
  homepage "https://github.com/JPWon-1/postq"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.0/postq-0.1.0-darwin-arm64.tar.gz"
      sha256 "f396343ae4712e36d1d21dc6781575ddfff11865fa00b0c8417b559e8ab1ba89"
    end
    on_intel do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.0/postq-0.1.0-darwin-x64.tar.gz"
      sha256 "adb58fb83c009f6d8f8aaf11d762bc9e4d2d8901018e90803360c3568079347a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.0/postq-0.1.0-linux-arm64.tar.gz"
      sha256 "123d967a641ba4cb519ed4a02886d37aa7c004e86f55d83af03db422d955aa55"
    end
    on_intel do
      url "https://github.com/JPWon-1/postq/releases/download/v0.1.0/postq-0.1.0-linux-x64.tar.gz"
      sha256 "336df78e35b83deb1e73b1432e981f66cea8479d6559d05385028422d15f10e5"
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
