module GUI
  class MainWindow < BaseWindow
    include ButtonPalette
    def initialize()
      super()

      LVGL::LVLabel.new(@container).tap do |label|
        label.set_long_mode(LVGL::LABEL_LONG::BREAK)
        label.set_text(%Q{Your device booted to\nstage-2 of a NixOS system successfully!\n\nSelect from the following options})
        label.set_align(LVGL::LABEL_ALIGN::CENTER)
        label.set_width(@container.get_width_fit)
      end

      add_buttons([
        ["Display validation", ->() { DisplayValidationWindow.instance.present }],
        ["Input devices information", ->() { InputsWindow.instance.present }],
        ["Disks information", ->() { DisksWindow.instance.present }],
        ["Logs", ->() { LogsWindow.instance.present }],
        ["About", ->() { AboutWindow.instance.present }],
        ["Quit",  ->() { QuitWindow.instance.present }],
      ])
    end
  end
end
