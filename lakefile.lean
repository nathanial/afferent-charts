import Lake
open Lake DSL

package afferent-charts where
  version := v!"0.1.0"

require crucible from git "https://github.com/nathanial/crucible" @ "v0.0.9"

@[default_target]
lean_lib AfferentCharts where
  roots := #[`AfferentCharts]

lean_lib Tests where
  roots := #[`Tests]

@[test_driver]
lean_exe afferent-charts_tests where
  root := `Tests.Main
