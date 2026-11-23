// =========================================================================
// Môn học: Xử lý tín hiệu số (DSP) - Lab #5
// File: lab5_3_20_pz.sci - Sơ đồ cực - zero của Bài tập 3.20
// Tín hiệu: x1[n] = r^n sin(omega0 * n) u[n], minh họa r = 0.75, omega0 = pi/3
// =========================================================================

clear; clc; clf;

r = 0.75;
w0 = %pi / 3;

px = r * cos(w0);
py = r * sin(w0);

h_fig = scf(5); clf(h_fig);
theta = linspace(0, 2*%pi, 360);

plot(cos(theta), sin(theta), 'k-.');
plot(r*cos(theta), r*sin(theta), 'b--');
plot(0, 0, 'bo');
plot([px, px], [py, -py], 'rx');
plot([0, px], [0, py], 'r:');
plot([0, px], [0, -py], 'r:');

xgrid(12); isoview();
title("So do cuc - zero Bai 3.20 (r = 0.75, omega0 = pi/3)");
xlabel("Re(z)"); ylabel("Im(z)");

if isdir("Images") then
    img_dir = "Images/";
elseif isdir("../Images") then
    img_dir = "../Images/";
else
    mkdir("Images");
    img_dir = "Images/";
end
xs2png(h_fig, img_dir + "lab5_3_20_pz.png");
mprintf("Đã lưu sơ đồ cực - zero Bài 3.20 tại: %slab5_3_20_pz.png\n", img_dir);
