//
//  UserDefaultsHelper.swift
//  TodoList
//
//  Created by soyoongdev on 11/11/2024.
//

/**
 UserDefaults: là một API trong Swift giúp lưu trữ và truy xuất dữ liệu đơn giản, được sử dụng để lưu các cài đặt hoặc dữ liệu của người dùng theo cách vĩnh viễn trên thiết bị. UserDefaults thích hợp cho việc lưu các thông tin có kích thước nhỏ và có tính chất tồn tại lâu dài (persistent), chẳng hạn như:
 
 * Lưu trạng thái đăng nhập.
 * Lưu các tùy chọn hoặc thiết lập của người dùng (chế độ tối/sáng, ngôn ngữ, âm lượng...).
 * Lưu các dữ liệu cơ bản (như số đếm, dữ liệu cấu hình).
 
 */

import Foundation

/*
 Tạo class UserDefaultsHelper giúp xây dựng sẵn cấu trúc,
 để việc truy vấn dữ liệu từ UserDefaults được dễ dàng, thuận tiện và dễ hiểu.
 **/
class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    
    private let defaults = UserDefaults.standard
    
    // Setup keys
    private let setupKey: String = "setup"
    private let countKey: String = "count"
    private let taskKey: String = "task"
    
    private init() {} // Ngăn chặn khởi tạo từ bên ngoài
    
    // MARK: - Getter và Setter cho các giá trị lưu trữ
    
    func setSetup(newValue: Bool, forKey: String? = nil) {
        self.defaults.set(newValue, forKey: forKey ?? self.setupKey)
    }
    
    func getSetup(forKey: String? = nil) -> Bool {
        return self.defaults.bool(forKey: forKey ?? self.setupKey)
    }
    
    func setCount(newValue: Int, forKey: String? = nil) {
        self.defaults.set(newValue, forKey: forKey ?? self.countKey)
    }
    
    func getCount(forKey: String? = nil) -> Int {
        return self.defaults.integer(forKey: forKey ?? self.countKey)
    }
    
    func setTask(newValue: String, forKey: String? = nil) {
        self.defaults.set(newValue, forKey: forKey ?? self.taskKey)
    }
    
    func getTask(forKey: String? = nil) -> String? {
        return self.defaults.string(forKey: forKey ?? self.taskKey)
    }
    
    // MARK: - Xóa Dữ Liệu
    func clear(with key: String) {
        self.defaults.removeObject(forKey: key)
    }
    
    
    // Xóa tất cả các dữ liệu lưu trữ
    func clearAll() {
        self.defaults.removeObject(forKey: self.setupKey)
        self.defaults.removeObject(forKey: self.countKey)
        self.defaults.removeObject(forKey: self.taskKey)
    }
}
