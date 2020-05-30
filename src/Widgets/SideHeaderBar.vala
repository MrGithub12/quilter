/*
* Copyright (c) 2017 Lains
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*/
namespace Quilter.Widgets {
    public class SideHeaderbar : Gtk.Revealer {
        public EditView sourceview;
        public MainWindow win;
        public Preview preview;
        public Hdy.ViewSwitcher stackswitcher;
        public Hdy.HeaderBar header;

        public SideHeaderbar (MainWindow win) {
            this.win = win;

            build_ui ();
            icons_toolbar ();
        }

        private void build_ui () {
            stackswitcher = new Hdy.ViewSwitcher ();
            var stackswitcher_context = stackswitcher.get_style_context ();
            stackswitcher_context.add_class ("sb-stackswitcher");

            header = new Hdy.HeaderBar ();
            var header_context = header.get_style_context ();
            header_context.add_class (Gtk.STYLE_CLASS_FLAT);
            header_context.add_class ("quilter-toolbar");
            header_context.add_class ("quilter-toolbar-side");
            header_context.add_class ("titlebar");

            header.set_custom_title (stackswitcher);

            header.set_show_close_button (true);
            header.has_subtitle = false;
            header.set_title (null);
            header.set_decoration_layout ("close:");

            this.transition_type = Gtk.RevealerTransitionType.SLIDE_UP;
            this.add (header);
            this.reveal_child = Quilter.Application.gsettings.get_boolean("sidebar-title");
            this.visible = Quilter.Application.gsettings.get_boolean("sidebar-title");
        }

        public void icons_toolbar () {
        }
    }
}