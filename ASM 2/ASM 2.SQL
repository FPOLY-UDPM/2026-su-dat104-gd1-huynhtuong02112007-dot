--1.	Cho biết danh sách vắng học (sinh viên vắng (TrangThai = 'A'))
SELECT *
FROM [Bài TEST 1].[dbo].[DiemDanh]
WHERE [TrangThai] = 'A'

--2.	Đếm số buổi vắng theo từng sinh viên
SELECT [MASV],
   COUNT(*) AS So_Buoi_Vang
FROM [Bài TEST 1].[dbo].[DiemDanh]
WHERE [TrangThai] = 'A'
GROUP BY [MASV]
ORDER BY So_Buoi_Vang DESC

--3.	Thêm 1 dòng (record) vào bảng DiemDanh - Thêm 1 dòng (record) vào bảng KhoiPhucDiemDanh
----Thêm 1 dòng (record) vào bảng DiemDanh
INSERT INTO DiemDanh([MASV],[Lop],[NgayHoc],[TrangThai])
  VALUES
   ('PS12345','DP21301','31/6','A')
----Thêm 1 dòng (record) vào bảng KhoiPhucDiemDanh
INSERT INTO KhoiPhucDiemDanh([MASV],[ma_lop],[NgayHoc],[NoiDung_SinhVien],[NoiDung_GiaoVien])
  VALUES
   ('PS12345','DP21301','31/6',N'Ốm',N'Ok')

--4.	Cập nhật trạng thái điểm danh của 1 sinh viên
 UPDATE DiemDanh
 SET [TrangThai] = 'P'
 WHERE [MASV] = 'PS12345'
  AND [Lop] = 'DP21301'
  AND [NgayHoc] = '31/6'

--5.	Giảng viên duyệt yêu cầu khôi phục điểm danh
UPDATE KhoiPhucDiemDanh
SET [Duyet] = 1
WHERE [MASV] = 'PS12345'
  AND [ma_lop] = 'DP21301'
  AND [NgayHoc] = '31/6'

 --6.	Xóa 1 yêu cầu khôi phục điểm danh theo MASV, Lop, và NgayHoc Mức 2
 DELETE FROM KhoiPhucDiemDanh
 WHERE  [MASV] = 'PS12345'
    AND [ma_lop] = 'DP21301'
    AND [NgayHoc] = '31/6'

--7.	Đếm số buổi vắng của từng sinh viên theo từng lớp
SELECT [MASV],[Lop], 
    COUNT(*) AS So_Buoi_Vang
FROM [Bài TEST 1].[dbo].[DiemDanh]
WHERE [TrangThai] ='A'
GROUP BY [MASV], [Lop]
ORDER BY So_Buoi_Vang DESC

--8.	Tìm sinh viên có số buổi vắng > 3
SELECT [MASV],
   COUNT(*) AS So_Buoi_Vang
FROM [Bài TEST 1].[dbo].[DiemDanh]
WHERE [TrangThai] ='A'
GROUP BY [MASV]
HAVING COUNT(*) > 3

--9.	Liệt kê sinh viên có yêu cầu khôi phục điểm danh trùng với ngày KHÔNG bị vắng
SELECT kp.*
FROM [Bài TEST 1].[dbo].[KhoiPhucDiemDanh] kp
  JOIN DiemDanh dd
    ON kp.[MASV] = dd.[MASV]
     AND kp.[ma_lop] = dd.[Lop]
     AND kp.[NgayHoc] = dd.[NgayHoc]
WHERE dd.[TrangThai] = 'P'

--10.	Cập nhật trạng thái điểm danh thành 'P' cho các sinh viên đã được duyệt khôi phục
UPDATE dd
SET dd.[Trangthai] ='P'
FROM [Bài TEST 1].[dbo].[DiemDanh] dd
 JOIN  [Bài TEST 1].[dbo].[KhoiPhucDiemDanh] kp
  ON dd.[MASV] = kp.[MASV]
   AND dd.[Lop] = kp.[ma_lop]
   AND dd.[NgayHoc] = kp.[NgayHoc]
WHERE kp.[Duyet] = 1

--11.	Tìm sinh viên có số buổi vắng nhiều nhất 
SELECT [MASV],
   Count([Trangthai]) as So_Buoi_Vang
FROM [Bài TEST 1].[dbo].[DiemDanh]
WHERE [Trangthai] = 'A'
GROUP BY [MASV]
HAVING COUNT([Trangthai]) = (
  SELECT MAX(Vang.So_Buoi_Vang_Mat) AS So_Buoi
  FROM
   (SELECT [MASV],
        COUNT([Trangthai]) as So_Buoi_Vang_Mat
    FROM [Bài TEST 1].[dbo].[DiemDanh]
    WHERE [Trangthai] = 'A'
    GROUP BY [MASV]
    )Vang
 )
--12.	Liệt kê tất cả điểm danh và yêu cầu khôi phục (nếu có) của lớp (ví dụ: DP21301)
SELECT 
    dd.[MASV],
    dd.[Lop],
    dd.[NgayHoc],
    dd.[Trangthai],
    CASE kp.[Duyet]
        WHEN 0 THEN N'Chưa duyệt'
        WHEN 1 THEN N'Đã duyệt'
        ELSE N'Không có yêu cầu'
    END AS TrangThaiKhoiPhuc
FROM [Bài TEST 1].[dbo].[DiemDanh] dd
LEFT JOIN KhoiPhucDiemDanh kp ON kp.MASV = dd.MASV 
    AND kp.[ma_Lop] = dd.[Lop]
WHERE dd.Lop = 'DP21301'
ORDER BY dd.MASV, dd.NgayHoc