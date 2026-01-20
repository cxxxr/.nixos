{ pkgs, ... }:

{
  xdg.configFile."niri/config.kdl" = {
    force = true;
    text = ''
    input {
        keyboard {
            xkb {
                layout "us"
            }
            repeat-delay 200
            repeat-rate 50
        }
        touchpad {
            tap
            dwt
            dwtp
            natural-scroll
            accel-speed 0.3
            accel-profile "adaptive"
        }
        mouse {
            accel-speed 0.0
            accel-profile "flat"
        }
        trackpoint {
            accel-speed 0.0
            accel-profile "flat"
        }
        warp-mouse-to-focus
        focus-follows-mouse max-scroll-amount="0%"
    }

    output "DP-6" {
        scale 1.0
    }

    output "eDP-1" {
        // scale 2.0
    }

    layout {
        gaps 16
        center-focused-column "never"

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        default-column-width { proportion 0.5; }

        focus-ring {
            width 4
            active-color "#7fc8ff"
            inactive-color "#505050"
        }

        border {
            off
        }

        shadow {
            on
            softness 30
            spread 5
            offset x=0 y=5
            color "#0007"
        }

        tab-indicator {
            hide-when-single-tab
            gap 5
            width 4
            length total-proportion=0.1
            position "left"
            gaps-between-tabs 2
            corner-radius 4
            active-color "white"
            inactive-color "gray"
        }
    }

    spawn-at-startup "waybar"

    prefer-no-csd

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    hotkey-overlay {
        skip-at-startup
    }

    animations {
    }

    window-rule {
        geometry-corner-radius 12
        clip-to-geometry true
    }

    window-rule {
        match app-id=r#"^com\.mitchellh\.ghostty$"#
        default-column-width {}
    }

    window-rule {
        match app-id=r#"^firefox$"# title=r#"^Picture-in-Picture$"#
        open-floating true
    }

    binds {
        // ターミナル（ghostty）
        Mod+T { spawn "ghostty"; }
        Mod+Return { spawn "ghostty"; }

        // アプリランチャー
        Mod+D { spawn "fuzzel"; }

        // ウィンドウを閉じる
        Mod+Q { close-window; }

        // フォーカス移動
        Mod+Left { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up { focus-window-up; }
        Mod+Down { focus-window-down; }

        Mod+H { focus-column-left; }
        Mod+L { focus-column-right; }
        Mod+K { focus-window-up; }
        Mod+J { focus-window-down; }

        Mod+Home { focus-column-first; }
        Mod+End { focus-column-last; }

        // ウィンドウ移動
        Mod+Ctrl+Left { move-column-left; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+Up { move-window-up; }
        Mod+Ctrl+Down { move-window-down; }

        Mod+Ctrl+H { move-column-left; }
        Mod+Ctrl+L { move-column-right; }
        Mod+Ctrl+K { move-window-up; }
        Mod+Ctrl+J { move-window-down; }

        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End { move-column-to-last; }

        // モニター間移動
        Mod+Shift+Left { focus-monitor-left; }
        Mod+Shift+Right { focus-monitor-right; }
        Mod+Shift+Up { focus-monitor-up; }
        Mod+Shift+Down { focus-monitor-down; }

        Mod+Shift+Ctrl+Left { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+Up { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+Down { move-column-to-monitor-down; }

        // ワークスペース
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Shift+1 { move-column-to-workspace 1; }
        Mod+Shift+2 { move-column-to-workspace 2; }
        Mod+Shift+3 { move-column-to-workspace 3; }
        Mod+Shift+4 { move-column-to-workspace 4; }
        Mod+Shift+5 { move-column-to-workspace 5; }
        Mod+Shift+6 { move-column-to-workspace 6; }
        Mod+Shift+7 { move-column-to-workspace 7; }
        Mod+Shift+8 { move-column-to-workspace 8; }
        Mod+Shift+9 { move-column-to-workspace 9; }

        Mod+Tab { focus-workspace-previous; }

        Mod+U { focus-workspace-down; }
        Mod+I { focus-workspace-up; }
        Mod+Ctrl+U { move-column-to-workspace-down; }
        Mod+Ctrl+I { move-column-to-workspace-up; }

        // ウィンドウサイズ
        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Ctrl+R { reset-window-height; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        // フルスクリーン・最大化
        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+C { center-column; }

        // 複数ウィンドウを1カラムに
        Mod+Comma { consume-window-into-column; }
        Mod+Period { expel-window-from-column; }

        // タブ化
        Mod+W { toggle-column-tabbed-display; }

        // スクリーンショット
        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        // スクリーンロック
        Mod+Alt+L { spawn "swaylock"; }

        // 電源メニュー
        Mod+Shift+P { spawn "wlogout"; }

        // niri終了
        Mod+Shift+E { quit; }

        // パワーオフ確認
        Mod+Shift+Ctrl+T { quit skip-confirmation=true; }
    }
  '';
  };
}
