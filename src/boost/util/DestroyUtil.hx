package boost.util;

class DestroyUtil {
	/**
	 * Checks if an object is not null before calling destroy(), always returns null.
	 *
	 * @param	object	An IFlxDestroyable object that will be destroyed if it's not null.
	 * @return	null
	 */
	public static function destroy<T:IDestroyable>(object:Null<IDestroyable>):T {
		if (object != null) {
			object.destroy();
		}
		return null;
	}

	/**
	 * Destroy every element of an array of IFlxDestroyables
	 *
	 * @param	array	An Array of IFlxDestroyable objects
	 * @return	null
	 */
	public static function destroyArray<T:IDestroyable>(array:Array<T>):Array<T> {
		if (array != null) {
			for (e in array)
				destroy(e);
			array.splice(0, array.length);
		}
		return null;
	}
}

interface IDestroyable {
	function destroy():Void;
}
