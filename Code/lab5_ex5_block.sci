// =========================================================================
// Môn học: Xử lý tín hiệu số (DSP) - Lab #5
// File: lab5_ex5_block.sci - Sơ đồ khối và kiểm chứng Bài tập 5
// Hệ thống: y[n] = 2y[n-1] - 3y[n-2] + x[n] + x[n-1]
// =========================================================================

clear; clc; clf;

// 1. Kiểm chứng h[n], y_zi[n] và y_zs[n]
N = 6;
n = 0 : N-1;
r = sqrt(3);
theta = atan(sqrt(2));

// Công thức giải tích
h_form   = (r .^ n) .* (cos(n * theta) + sqrt(2) * sin(n * theta));
yzi_form = -(r .^ n) .* (cos(n * theta) + 2 * sqrt(2) * sin(n * theta));
yzs_form = (2 .^ (n + 1)) - (r .^ n) .* cos(n * theta) + sqrt(2) * (r .^ n) .* sin(n * theta);

// Truy hồi trực tiếp từ phương trình sai phân
h_rec = zeros(1, N); yzi_rec = zeros(1, N); yzs_rec = zeros(1, N);
for k = 0 : N-1
    xn = bool2s(k == 0); xn1 = bool2s(k == 1);
    h1 = 0; h2 = 0;
    if k >= 1 then h1 = h_rec(k); end
    if k >= 2 then h2 = h_rec(k - 1); end
    h_rec(k + 1) = 2*h1 - 3*h2 + xn + xn1;

    z1 = 1; z2 = 1;
    if k >= 1 then z1 = yzi_rec(k); end
    if k >= 2 then z2 = yzi_rec(k - 1); end
    yzi_rec(k + 1) = 2*z1 - 3*z2;

    un = 2^k; un1 = 0;
    if k >= 1 then un1 = 2^(k - 1); end
    s1 = 0; s2 = 0;
    if k >= 1 then s1 = yzs_rec(k); end
    if k >= 2 then s2 = yzs_rec(k - 1); end
    yzs_rec(k + 1) = 2*s1 - 3*s2 + un + un1;
end

mprintf("=====================================================\n");
mprintf("        KIỂM CHỨNG BÀI TẬP 5 (HỆ BẬC HAI)            \n");
mprintf("=====================================================\n");
mprintf("h[0..5]   (truy hồi) : [ "); mprintf("%d ", h_rec);   mprintf("] (err=%.2e)\n", max(abs(h_rec - h_form)));
mprintf("yzi[0..5] (truy hồi) : [ "); mprintf("%d ", yzi_rec); mprintf("] (err=%.2e)\n", max(abs(yzi_rec - yzi_form)));
mprintf("yzs[0..5] (truy hồi) : [ "); mprintf("%d ", yzs_rec); mprintf("] (err=%.2e)\n", max(abs(yzs_rec - yzs_form)));
mprintf("=====================================================\n");

// 2. Vẽ sơ đồ khối hệ bậc hai (Direct Form I) bằng Scilab
h_fig = scf(2); clf(h_fig);
plot2d([0, 12.5], [0, 6.2], style=0, axesflag=0);
a = gca();
a.isoview = "on";

// Đường chính y = 4.8
xarrows([0.6; 3.35], [4.8; 4.8], 18, color("navy"));
xarrows([4.05; 6.25], [4.8; 4.8], 18, color("navy"));
xarrows([6.95; 8.65], [4.8; 4.8], 18, color("navy"));
xarrows([9.35; 11.9], [4.8; 4.8], 18, color("navy"));

// Ba bộ cộng tại x = 3.7, 6.6, 9.0
for cx = [3.7, 6.6, 9.0]
    xarc(cx - 0.35, 4.8 + 0.35, 0.7, 0.7, 0, 360*64);
    xstring(cx - 0.1, 4.65, "+");
end

// Nhánh tiến x[n-1]
xpoly([1.8, 1.8], [4.8, 3.1], "lines");
xarrows([1.8; 2.25], [3.1; 3.1], 16, color("navy"));
xrect(2.25, 3.45, 1.0, 0.7); xstring(2.55, 2.95, "z^-1");
xpoly([3.25, 3.7], [3.1, 3.1], "lines");
xarrows([3.7; 3.7], [3.1; 4.45], 16, color("navy"));

// Nhánh hồi tiếp y[n-1] và y[n-2]
xpoly([10.7, 10.7], [4.8, 3.1], "lines");
xarrows([10.7; 10.35], [3.1; 3.1], 16, color("navy"));
xrect(9.35, 3.45, 1.0, 0.7); xstring(9.65, 2.95, "z^-1");
xpoly([9.35, 9.0], [3.1, 3.1], "lines");

// Hệ số 2 cho y[n-1]
xrect(8.62, 4.22, 0.76, 0.55); xstring(8.92, 3.82, "2");
xarrows([9.0; 9.0], [3.1; 3.67], 14, color("navy"));
xarrows([9.0; 9.0], [4.22; 4.45], 14, color("navy"));

// Trễ thứ hai cho y[n-2] và hệ số -3
xpoly([9.0, 9.0], [3.1, 1.45], "lines");
xarrows([9.0; 8.3], [1.45; 1.45], 16, color("navy"));
xrect(7.3, 1.8, 1.0, 0.7); xstring(7.6, 1.3, "z^-1");
xpoly([7.3, 6.6], [1.45, 1.45], "lines");
xrect(6.18, 3.38, 0.84, 0.56); xstring(6.42, 2.98, "-3");
xarrows([6.6; 6.6], [1.45; 2.82], 16, color("navy"));
xarrows([6.6; 6.6], [3.38; 4.45], 16, color("navy"));

// Nhãn
xstring(0.7, 5.0, "x[n]"); xstring(11.4, 5.0, "y[n]");
xstring(4.0, 3.6, "x[n-1]"); xstring(8.0, 2.6, "y[n-1]"); xstring(5.5, 1.3, "y[n-2]");
title("So do khoi he thong bac hai (Direct Form I)");

if isdir("Images") then
    img_dir = "Images/";
elseif isdir("../Images") then
    img_dir = "../Images/";
else
    mkdir("Images");
    img_dir = "Images/";
end
xs2png(h_fig, img_dir + "lab5_ex5_block.png");
mprintf("Đã xuất sơ đồ khối tại: %slab5_ex5_block.png\n", img_dir);
