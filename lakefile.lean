import Lake
open Lake DSL

package afferent_charts where
  version := v!"0.1.0"

require afferent from git "https://github.com/nathanial/afferent" @ "v0.0.15"
require crucible from git "https://github.com/nathanial/crucible" @ "v0.0.10"

-- Common link arguments for macOS framework dependencies via Afferent
def commonLinkArgs : Array String := #[
  "-framework", "Metal",
  "-framework", "Cocoa",
  "-framework", "QuartzCore",
  "-framework", "Foundation",
  "-framework", "Security",
  "-framework", "SystemConfiguration",
  "-lobjc",
  "-L/opt/homebrew/lib",    -- Apple Silicon Homebrew
  "-L/usr/local/lib",        -- Intel Homebrew fallback
  "-lfreetype",
  "-lassimp",
  "-lz",
  "-lc++",
  "-lcurl"                   -- Required by Wisp (HTTP client via Oracle)
]

@[default_target]
lean_lib AfferentCharts where
  roots := #[`AfferentCharts]

lean_lib Tests where
  roots := #[`Tests]

@[test_driver]
lean_exe afferent_charts_tests where
  root := `Tests.Main
  moreLinkArgs := commonLinkArgs
