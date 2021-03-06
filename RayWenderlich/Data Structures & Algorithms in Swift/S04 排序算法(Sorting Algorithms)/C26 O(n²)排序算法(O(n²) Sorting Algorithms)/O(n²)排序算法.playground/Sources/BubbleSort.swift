/**
 冒泡儿排序算法的实现
 * 冒泡排序的算法思想非常简单: 即遍历数组中的元素，如果临近两个元素的大小顺序
 * 不对，就将两者进行交换，重复这个操作，直到整个数组排好序。
 *
 * 以数组[9, 4, 10, 3]为例:
 * - 第一趟: 9和4进行比较，因为9比4大，所以他们交换位置，变为[4, 9, 10, 3]
 *   下标继续往后面走，9和10比较，因为9比10小，所以数组还是之前的[4, 9, 10, 3]
 *   接下，下标继续往后面走，10和3进行比较，因为10比3大，所以他们交换位置，因此
 *   数组顺序变为[4, 9, 3, 10]
 * - 第二趟: 先比较4和9，因为4比9小，所以无需交换，所以此时数组依然是[4, 9, 3, 10]
 *   接下来，下标往后走，比较9和3。因为9比3大，所以交换他们的位置，此时数组为[4, 3, 9, 10]
 *   接下来，比较9和10。因为9比10小，所以无需交换。最终，第二趟下来，数组顺序为[4, 3, 9, 10]
 * - 第三趟: 4和3进行比较。因为4比3大，所以交换他们的顺序，此时数组为[3, 4, 9, 10]
 * - 接下来依次比较4和9，9和10，最终得到的结果为[3, 4, 9, 10]
 */

import Foundation


/// 按照升序，对一个数组进行冒泡排序
///
/// - Parameter array: 一个数据元素可以进行比较(也就是元素遵守Comparable协议)的数组
public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    // 如果数组中的元素不超过2个，就没必要进行排序，直接返回
    guard array.count >= 2 else { return }
    
    // 遍历数组中的元素，确定起泡的次数
    for end in (1..<array.count).reversed() {
        
        // 标记是否进行了交换
        var swapped = false
        
        // 遍历数组，比较相邻元素的大小
        for current in 0..<end {
            
            // 比较相邻的两个值的大小，按照升序进行排列
            // 如果是升序，只需将>改为<即可
            if array[current] > array[current + 1] {
                
                // 交换相邻两个值的位置，并且设置swapped为true
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        
        // 如果没有值需要进行交换，就说明排序已经完成，直接退出
        if !swapped { return }
    }
}

