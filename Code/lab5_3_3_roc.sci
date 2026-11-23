// =========================================================================
// Môn học: Xử lý tín hiệu số (DSP) - Lab #5
// File: lab5_3_3_roc.sci - Vẽ 4 miền hội tụ (ROC) của Bài tập 3.3
// =========================================================================

clear; clc; clf;

h_fig = scf(3); clf(h_fig);
theta = linspace(0, 2*%pi, 360);

// --- 3.3(a): 1/3 < |z| < 2 ---
subplot(2, 2, 1);
plot(2*cos(theta), 2*sin(theta), 'g--');
plot((1/3)*cos(theta), (1/3)*sin(theta), 'g--');
plot(cos(theta), sin(theta), 'k:');
plot([1/3, 2], [0, 0], 'rx');
xgrid(12); isoview();
title("Bai 3.3(a): 1/3 < |z| < 2");
xlabel("Re(z)"); ylabel("Im(z)");

// --- 3.3(b): |z| > 2 ---
subplot(2, 2, 2);
plot(2*cos(theta), 2*sin(theta), 'g--');
plot([1/3, 2], [0, 0], 'rx');
xgrid(12); isoview();
title("Bai 3.3(b): |z| > 2");
xlabel("Re(z)"); ylabel("Im(z)");

// --- 3.3(c): 1/3 < |z| < 2 ---
subplot(2, 2, 3);
plot(2*cos(theta), 2*sin(theta), 'g--');
plot((1/3)*cos(theta), (1/3)*sin(theta), 'g--');
plot(cos(theta), sin(theta), 'k:');
plot([1/3, 2], [0, 0], 'rx');
xgrid(12); isoview();
title("Bai 3.3(c): 1/3 < |z| < 2");
xlabel("Re(z)"); ylabel("Im(z)");

// --- 3.3(d): 1/2 < |z| < 3 ---
subplot(2, 2, 4);
plot(3*cos(theta), 3*sin(theta), 'g--');
plot(0.5*cos(theta), 0.5*sin(theta), 'g--');
plot(cos(theta), sin(theta), 'k:');
plot([0.5, 3], [0, 0], 'rx');
xgrid(12); isoview();
title("Bai 3.3(d): 1/2 < |z| < 3");
xlabel("Re(z)"); ylabel("Im(z)");

if isdir("Images") then
    img_dir = "Images/";
elseif isdir("../Images") then
    img_dir = "../Images/";
else
    mkdir("Images");
    img_dir = "Images/";
end
xs2png(h_fig, img_dir + "lab5_3_3_roc.png");
mprintf("Đã lưu sơ đồ ROC Bài 3.3 tại: %slab5_3_3_roc.png\n", img_dir);
