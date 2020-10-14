// this class would be normally generated from your asset structure,
// either statically (as part of the asset pipeline), or at macro-time

// we specify image paths relative to the assets root as field documentation
// and then run a very simple build macros on the class that turns that
// into an absolute uri for the VS Code markdown hint renderer

@:build(AssetsMacro.prepareImageLinks())
class Assets {
	/**
		haxe.png
	**/
	public static var haxe:String;
}
