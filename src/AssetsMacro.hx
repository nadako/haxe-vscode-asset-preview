#if macro
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;

// we need this macro, because (as far as I know), VS Code markdown renderer does not
// support relative paths for images and links in code hints, so we transform paths
// relative to asset root given in field docs into absolute file:/// URIs based on the
// current working directory (which is where you open the project)

// we also add markdown link+image syntax here, because it's simplier :)

class AssetsMacro {
	static final prefix = "file:///" + Path.normalize(Sys.getCwd()) + "/assets/";

	static function prepareImageLinks():Array<Field> {
		var fields = Context.getBuildFields();
		for (field in fields) {
			if (field.doc != null) {
				var filePath = StringTools.trim(field.doc);
				var fileUri = prefix + filePath;
				field.doc = '[![]($fileUri)]($fileUri)';
			}
		}
		return fields;
	}
}
#end
