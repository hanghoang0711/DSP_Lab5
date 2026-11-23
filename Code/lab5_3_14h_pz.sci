// =========================================================================
// Môn học: Xử lý tín hiệu số (DSP) - Lab #5
// File: lab5_3_14h_pz.sci - Sơ đồ cực - zero và kiểm chứng Bài tập 3.14(h)
// =========================================================================

clear; clc; clf;

// 1. Kiểm chứng biến đổi Z ngược của Bài 3.14(h)
// Zeros: z1 = -1/2, z2 = -1/4, z3 = 0; Poles: p1 = 1/2, p2,3 = (1 +- j)/2; G = 1/4
z_test = 2.0; // nằm trong ROC nhân quả |z| > 1/sqrt(2)
X_exact = 0.25 * z_test * (z_test + 0.5) * (z_test + 0.25) / ((z_test - 0.5) * (z_test^2 - z_test + 0.5));

n = 0 : 120;
x_n = (3/4)*(0.5 .^ n) - (1/2)*((1/sqrt(2)) .^ n) .* cos(n*%pi/4) + (7/8)*((1/sqrt(2)) .^ n) .* sin(n*%pi/4);
X_series = sum(x_n .* (z_test .^ (-n)));

mprintf("=====================================================\n");
mprintf("            KIỂM CHỨNG BÀI TẬP 3.14(h)               \n");
mprintf("=====================================================\n");
mprintf("Các điểm zero : z1 = -0.5, z2 = -0.25, z3 = 0\n");
mprintf("Các điểm cực  : p1 = 0.5, p2,3 = 0.5 +- 0.5j\n");
mprintf("X(2.0) giải tích : %.8f\n", X_exact);
mprintf("X(2.0) từ x[n]   : %.8f\n", X_series);
mprintf("Sai số tuyệt đối : %.3e\n", abs(X_exact - X_series));
mprintf("=====================================================\n");

// 2. Vẽ sơ đồ cực - zero
h_fig = scf(4); clf(h_fig);
theta = linspace(0, 2*%pi, 360);
r_roc = 1 / sqrt(2);

plot(cos(theta), sin(theta), 'k-.');
plot(r_roc*cos(theta), r_roc*sin(theta), 'g--');
plot([-0.5, -0.25, 0], [0, 0, 0], 'bo');
plot([0.5, 0.5, 0.5], [0, 0.5, -0.5], 'rx');
xgrid(12); isoview();
title("So do cuc - zero va ROC nhan qua Bai 3.14(h)");
xlabel("Re(z)"); ylabel("Im(z)");

if isdir("Images") then
    img_dir = "Images/";
elseif isdir("../Images") then
    img_dir = "../Images/";
else
    mkdir("Images");
    img_dir = "Images/";
end
xs2png(h_fig, img_dir + "lab5_3_14h_pz.png");
mprintf("Đã lưu sơ đồ cực - zero tại: %slab5_3_14h_pz.png\n", img_dir);
