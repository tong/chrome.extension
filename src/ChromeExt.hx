
/**
    Helper macro to avoid adding the chrome_ext compiler directive when using chrome-app from haxelib.
*/
class ChromeExt {

    static function setupCompiler() {
        if( !haxe.macro.Context.defined( 'chrome_app' ) ) {
            haxe.macro.Compiler.define( 'chrome_ext', '1' );
        }
    }
}
