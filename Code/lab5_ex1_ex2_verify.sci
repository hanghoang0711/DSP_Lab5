// =========================================================================
// Môn học: Xử lý tín hiệu số (DSP) - Lab #5
// File: lab5_ex1_ex2_verify.sci - Kiểm chứng Bài tập 1 và Bài tập 2
// =========================================================================

clear; clc;

// --- Bài tập 1: y[n] - y[n-2] = x[n] ---
N1 = 8;
h1 = zeros(1, N1);
for n = 0 : N1-1
    x_n = bool2s(n == 0);
    h_prev2 = 0;
    if n >= 2 then h_prev2 = h1(n - 1); end
    h1(n + 1) = x_n + h_prev2;
end

// --- Bài tập 2(a): Tích chập dãy hữu hạn ---
x1_a = [1, 2, 3, 4, 5];
x2_a = [1, 1, 1];
y2_a = conv(x1_a, x2_a);

// --- Bài tập 2(b): x1 = (1/5)^n u[n], x2 = 2^n u[n] ---
n = 0 : 5;
y2_b = (10/9) * (2 .^ n) - (1/9) * ((1/5) .^ n);

// --- Bài tập 2(c): x1 = n u[n], x2 = 2^n u[n-1] ---
y2_c = 2 * ((2 .^ n) - (n + 1));

mprintf("=====================================================\n");
mprintf("          KIỂM CHỨNG BÀI TẬP 1 VÀ BÀI TẬP 2          \n");
mprintf("=====================================================\n");
mprintf("Bai 1  h[0..7]   : [ "); mprintf("%d ", h1); mprintf("]\n");
mprintf("Bai 2a y[0..6]   : [ "); mprintf("%d ", y2_a); mprintf("]\n");
mprintf("Bai 2b y[0..5]   : [ "); mprintf("%.4f ", y2_b); mprintf("]\n");
mprintf("Bai 2c y[0..5]   : [ "); mprintf("%d ", y2_c); mprintf("]\n");
mprintf("=====================================================\n");
