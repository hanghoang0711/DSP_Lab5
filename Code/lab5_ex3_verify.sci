// =========================================================================
// Môn học: Xử lý tín hiệu số (DSP) - Lab #5
// File: lab5_ex3_verify.sci - Kiểm chứng biến đổi Z ngược Bài tập 3
// =========================================================================

clear; clc;

// --- Bài tập 3(c): X3(z) = (1 + z^-1) / ((1 - 0.5z^-1)^2 (1 - 0.3z^-1)) ---
// ROC: 0.3 < |z| < 0.5
// Kiểm chứng tại điểm z = 0.4 nằm trong miền hội tụ
z = 0.4;
X3_exact = (1 + 1/z) / ((1 - 0.5/z)^2 * (1 - 0.3/z));

n_pos = 0 : 120;
n_neg = -1 : -1 : -120;

x_pos = (39/4) * (0.3 .^ n_pos);
x_neg = ((35/4) - (15/2) * n_neg) .* (0.5 .^ n_neg);

X3_series = sum(x_pos .* (z .^ (-n_pos))) + sum(x_neg .* (z .^ (-n_neg)));
err_3c = abs(X3_exact - X3_series);

mprintf("=====================================================\n");
mprintf("            KIỂM CHỨNG BÀI TẬP 3(c)                  \n");
mprintf("=====================================================\n");
mprintf("Điểm kiểm tra z (trong 0.3 < |z| < 0.5): %.2f\n", z);
mprintf("Giá trị giải tích X3(0.4)              : %.8f\n", X3_exact);
mprintf("Tổng chuỗi Z từ nghiệm x[n]            : %.8f\n", X3_series);
mprintf("Sai số tuyệt đối                       : %.3e\n", err_3c);
mprintf("=====================================================\n");
