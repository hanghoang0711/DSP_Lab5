# Digital Signal Processing - Lab #5 (HK261)

**Trường Đại học Bách khoa - ĐHQG TP.HCM**  
**Khoa Khoa học và Kỹ thuật Máy tính**  
**Môn học:** Xử lý tín hiệu số (Digital Signal Processing)  
**Chuyên đề:** Biến đổi Z, Biến đổi $Z^+$ và Biến đổi Z ngược

---

## 📁 Cấu trúc thư mục

```text
├── Code/
│   ├── lab5_ex1_ex2_verify.sci   # Kiểm chứng đáp ứng xung Bài 1 và tích chập Bài 2
│   ├── lab5_ex3_verify.sci       # Kiểm chứng biến đổi Z ngược Bài 3(c)
│   ├── lab5_ex4_block.sci        # Vẽ sơ đồ khối và kiểm chứng Bài 4 (hệ bậc nhất)
│   ├── lab5_ex5_block.sci        # Vẽ sơ đồ khối và kiểm chứng Bài 5 (hệ bậc hai)
│   ├── lab5_3_3_roc.sci          # Vẽ 4 miền hội tụ (ROC) của Bài 3.3
│   ├── lab5_3_14h_pz.sci         # Vẽ sơ đồ cực - zero và kiểm chứng Bài 3.14(h)
│   └── lab5_3_20_pz.sci          # Vẽ sơ đồ cực - zero của Bài 3.20
│
├── Console/
│   ├── lab5_ex1_ex2_console.txt  # Kết quả Console Bài 1 & Bài 2
│   ├── lab5_ex3_console.txt      # Kết quả Console Bài 3(c)
│   ├── lab5_ex4_console.txt      # Kết quả Console Bài 4
│   ├── lab5_ex5_console.txt      # Kết quả Console Bài 5
│   └── lab5_3_14h_console.txt    # Kết quả Console Bài 3.14(h)
│
├── Images/
│   ├── lab5_ex4_block.png        # Sơ đồ khối hệ thống bậc nhất (Bài 4)
│   ├── lab5_ex5_block.png        # Sơ đồ khối hệ thống bậc hai (Bài 5)
│   ├── lab5_3_3_roc.png          # Minh họa 4 miền hội tụ (Bài 3.3)
│   ├── lab5_3_14h_pz.png         # Sơ đồ cực - zero (Bài 3.14h)
│   └── lab5_3_20_pz.png          # Sơ đồ cực - zero (Bài 3.20)
│
└── README.md
```

---

## 🚀 Hướng dẫn chạy trong Scilab

1. Mở phần mềm **Scilab** và chọn *Working Directory* là thư mục gốc của repository.
2. Chạy từng kịch bản `.sci` bằng lệnh `exec`:
   ```scilab
   exec('Code/lab5_ex1_ex2_verify.sci');
   exec('Code/lab5_ex3_verify.sci');
   exec('Code/lab5_ex4_block.sci');
   exec('Code/lab5_ex5_block.sci');
   exec('Code/lab5_3_3_roc.sci');
   exec('Code/lab5_3_14h_pz.sci');
   exec('Code/lab5_3_20_pz.sci');
   ```
3. Các hình vẽ kết quả sẽ được lưu vào thư mục `Images/`.
