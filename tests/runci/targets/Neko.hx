package runci.targets;

import runci.System.*;
import runci.Config.*;

class Neko {
	static public function run(args:Array<String>) {
		runCommand("haxe", ["compile-neko.hxml", "-D", "dump", "-D", "dump_ignore_var_ids"].concat(args));
		runCommand("neko", ["bin/unit.n"]);
	}
}
