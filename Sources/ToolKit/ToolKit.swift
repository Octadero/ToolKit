import Foundation
#if os(Linux)
	import Glibc
#else
	import Darwin
#endif

public struct ToolKit {
	enum ToolKitError: Error {
		case canNotComputeBasis
	}
	public static func rand(basis: ClosedRange<Int>) -> Int {
		#if os(Linux)
			return basis.lowerBound + Int(Glibc.random() % Int(basis.upperBound - basis.lowerBound + 1))
		#else
			return basis.lowerBound + Int(arc4random_uniform(UInt32(basis.upperBound - basis.lowerBound + 1)))
		#endif
	}
	
	public static func randf() -> Float {
		#if os(Linux)
			return (Float(random()) / Float(UINT32_MAX) + Float(random()) / Float(UINT32_MAX))
		#else
			return Float(arc4random()) / Float(UINT32_MAX)
		#endif
	}
}

public extension Array {
	var any: Element? {
	
		if self.count == 0 {
			return nil
		}
		
		if self.count == 1 {
			return self.first
		}
		
		let index = ToolKit.rand(basis: 0...self.count-1)
		return self[index]
	}
}
