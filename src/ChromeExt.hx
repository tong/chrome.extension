
/**
    Helper macro to avoid adding the chrome_ext compiler directive when using chrome-app from haxelib.
*/
class ChromeExt {

    static function setupCompiler() {
        if( !haxe.macro.Context.defined( 'chrome_app' ) ) {
            //TODO use chrome_extension only
            haxe.macro.Compiler.define( 'chrome_ext', '1' );
            haxe.macro.Compiler.define( 'chrome_extension', '1' );
        }
    }
}
