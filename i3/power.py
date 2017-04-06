#!/usr/bin/env python

# based on cb-exit used in CrunchBang Linux <http://crunchbanglinux.org/>

import pygtk
import pango
pygtk.require('2.0')
import gtk
import os
import getpass

class i3_exit:
    def disable_buttons(self):
        self.cancel.set_sensitive(False)
        self.reboot.set_sensitive(False)
        self.shutdown.set_sensitive(False)

    def cancel_action(self,btn):
        self.disable_buttons()
        gtk.main_quit()

    def logout_action(self,btn):
        self.disable_buttons()
        os.system("i3-msg [class=\".*\"] kill")
        os.system("i3-msg exit")

    def reboot_action(self,btn):
        self.disable_buttons()
        os.system("i3-msg [class=\".*\"] kill")
        os.system("systemctl reboot")

    def shutdown_action(self,btn):
        self.disable_buttons()
        os.system("i3-msg [class=\".*\"] kill")
        os.system("systemctl poweroff")

    def create_window(self):
        self.window = gtk.Window()
        self.window.set_size_request(500, 80)
        self.window.set_resizable(False)
        self.window.set_keep_above(True)
        self.window.stick
        self.window.set_position(1)
        self.window.connect("delete_event", gtk.main_quit)

        #Create HBox for buttons
        self.button_box = gtk.HBox()
        self.button_box.show()

        #Cancel button
        self.cancel = gtk.Button("")
        self.cancel.get_child().set_markup("<span font-family='DejaVu Sans Mono' font-size='large'>Cancel</span>")
        self.cancel.set_border_width(4)
        self.cancel.connect("clicked", self.cancel_action)
        self.button_box.pack_start(self.cancel)
        self.cancel.show()

        #Logout button
        self.logout = gtk.Button("")
        self.logout.get_child().set_markup("<span font-family='DejaVu Sans Mono' font-size='large'>Logout</span>")
        self.logout.set_border_width(4)
        self.logout.connect("clicked", self.logout_action)
        self.button_box.pack_start(self.logout)
        self.logout.show()


        #Reboot button
        self.reboot = gtk.Button("")
        self.reboot.get_child().set_markup("<span font-family='DejaVu Sans Mono' font-size='large'>Reboot</span>")
        self.reboot.set_border_width(4)
        self.reboot.connect("clicked", self.reboot_action)
        self.button_box.pack_start(self.reboot)
        self.reboot.show()

        #Shutdown button
        self.shutdown = gtk.Button("")
        self.shutdown.get_child().set_markup("<span font-family='DejaVu Sans Mono' font-size='large'>Shut Down</span>")
        self.shutdown.set_border_width(4)
        self.shutdown.connect("clicked", self.shutdown_action)
        self.button_box.pack_start(self.shutdown)
        self.shutdown.show()

        self.window.add(self.button_box)
        self.window.show()
    def __init__(self):
        self.create_window()

def main():
    gtk.main()

if __name__ == "__main__":
    go = i3_exit()
    main()
