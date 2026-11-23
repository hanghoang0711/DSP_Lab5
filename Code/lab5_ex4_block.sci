// =========================================================================
// Môn học: Xử lý tín hiệu số (DSP) - Lab #5
// File: lab5_ex4_block.sci - Sơ đồ khối và kiểm chứng Bài tập 4
// Hệ thống: y[n] = 0.7 y[n-1] + x[n]
// =========================================================================

clear; clc; clf;

// 1. Kiểm chứng đáp ứng xung h[n] và đáp ứng bước y[n]
n = 0 : 7;
h_exact = (0.7) .^ n;
y_exact = (10/3) * (1 - (0.7) .^ (n + 1));

// Tính trực tiếp bằng phương trình truy hồi
y_rec = zeros(1, length(n));
for k = 1 : length(n)
    if k == 1 then
        y_rec(k) = 1;
    else
        y_rec(k) = 0.7 * y_rec(k - 1) + 1;
    end
end

mprintf("=====================================================\n");
mprintf("        KIỂM CHỨNG BÀI TẬP 4 (HỆ BẬC NHẤT)           \n");
mprintf("=====================================================\n");
mprintf("h[0..7] (công thức) : [ "); mprintf("%.4f ", h_exact); mprintf("]\n");
mprintf("y[0..7] (công thức) : [ "); mprintf("%.4f ", y_exact); mprintf("]\n");
mprintf("y[0..7] (truy hồi)  : [ "); mprintf("%.4f ", y_rec);   mprintf("]\n");
mprintf("Sai số lớn nhất     : %.3e\n", max(abs(y_exact - y_rec)));
mprintf("=====================================================\n");

// 2. Vẽ sơ đồ khối hệ thống bậc nhất bằng Scilab
h_fig = scf(1); clf(h_fig);
plot2d([0, 10], [0, 5], style=0, axesflag=0);
a = gca();
a.isoview = "on";

// Đường tín hiệu chính: x[n] -> (+) -> y[n]
xarrows([1.0; 2.85], [3.5; 3.5], 20, color("navy"));
xarrows([3.55; 9.0], [3.5; 3.5], 20, color("navy"));

// Bộ cộng (+) tại (3.2, 3.5)
xarc(2.85, 3.85, 0.7, 0.7, 0, 360*64);
xstring(3.08, 3.35, "+");

// Nhánh hồi tiếp: từ (7.6, 3.5) xuống (7.6, 1.7) -> z^-1 -> 0.7 -> lên (3.2, 3.15)
xpoly([7.6, 7.6], [3.5, 1.7], "lines");
xarrows([7.6; 6.95], [1.7; 1.7], 18, color("navy"));

// Khối trễ z^-1
xrect(5.85, 2.05, 1.1, 0.7);
xstring(6.18, 1.55, "z^-1");

xarrows([5.85; 5.15], [1.7; 1.7], 18, color("navy"));

// Khối khuếch đại 0.7
xrect(4.1, 2.05, 1.05, 0.7);
xstring(4.45, 1.55, "0.7");

xpoly([4.1, 3.2], [1.7, 1.7], "lines");
xarrows([3.2; 3.2], [1.7; 3.15], 18, color("navy"));

// Nhãn tín hiệu
xstring(1.1, 3.7, "x[n]");
xstring(8.5, 3.7, "y[n]");
xstring(5.2, 1.05, "y[n-1]");
xstring(2.0, 2.4, "0.7 y[n-1]");
title("So do khoi he thong bac nhat: y[n] = 0.7 y[n-1] + x[n]");

if isdir("Images") then
    img_dir = "Images/";
elseif isdir("../Images") then
    img_dir = "../Images/";
else
    mkdir("Images");
    img_dir = "Images/";
end
xs2png(h_fig, img_dir + "lab5_ex4_block.png");
mprintf("Đã xuất sơ đồ khối tại: %slab5_ex4_block.png\n", img_dir);
