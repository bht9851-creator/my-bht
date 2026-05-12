<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>تقرير تنفيذ برنامج مدرستي</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;500;600;700;800&family=Tajawal:wght@400;500;700&display=swap" rel="stylesheet">

<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

:root {
  --moe-green:   #1a6b3c;
  --moe-green2:  #2d8a52;
  --moe-green-lt:#e8f4ee;
  --moe-gold:    #c8973a;
  --moe-gold-lt: #fdf6e8;
  --text-dark:   #1a2233;
  --text-mid:    #3d4d60;
  --text-light:  #7a8fa6;
  --border:      #d8e4ec;
  --bg-page:     #eef2f6;
  --white:       #ffffff;
  --radius:      10px;
  --font-main:   'Cairo', sans-serif;
}

body {
  font-family: var(--font-main);
  background: var(--bg-page);
  color: var(--text-dark);
  direction: rtl;
  min-height: 100vh;
  padding: 24px 16px 40px;
}

/* TOOLBAR */
.toolbar {
  max-width: 210mm;
  margin: 0 auto 12px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 10px;
  flex-wrap: wrap;
}
.toolbar-label {
  font-size: 13px;
  color: var(--text-light);
  display: flex;
  align-items: center;
  gap: 6px;
}
.toolbar-actions { display: flex; gap: 8px; }
.btn-print {
  display: inline-flex;
  align-items: center;
  gap: 7px;
  background: var(--moe-green);
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 9px 20px;
  font-family: var(--font-main);
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  box-shadow: 0 3px 10px rgba(26,107,60,0.25);
}
.btn-print:hover { background: var(--moe-green2); transform: translateY(-1px); }
.btn-reset {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: transparent;
  color: var(--text-mid);
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 8px 16px;
  font-family: var(--font-main);
  font-size: 13px;
  cursor: pointer;
  transition: all 0.2s;
}
.btn-reset:hover { border-color: var(--moe-green); color: var(--moe-green); }

/* HINT */
.edit-hint-bar {
  max-width: 210mm;
  margin: 0 auto 12px;
  background: rgba(26,107,60,0.07);
  border: 1px solid rgba(26,107,60,0.15);
  border-radius: 8px;
  padding: 7px 14px;
  font-size: 12px;
  color: var(--moe-green);
  display: flex;
  align-items: center;
  gap: 7px;
}

/* A4 PAGE */
.page {
  width: 210mm;
  min-height: 297mm;
  margin: 0 auto;
  background: var(--white);
  box-shadow: 0 4px 32px rgba(0,0,0,0.13);
  border-radius: 4px;
  padding: 13mm 13mm 11mm;
  display: flex;
  flex-direction: column;
  gap: 0;
}

.top-stripe {
  height: 5px;
  background: linear-gradient(to left, var(--moe-green), var(--moe-gold), var(--moe-green));
  border-radius: 3px;
  margin-bottom: 11px;
}

/* HEADER */
.page-header {
  display: flex;
  align-items: center;
  gap: 13px;
  padding-bottom: 11px;
  border-bottom: 1.5px solid var(--moe-green-lt);
  margin-bottom: 9px;
}
.header-logo {
  flex-shrink: 0; width: 70px; height: 70px;
  position: relative; cursor: pointer;
  border-radius: 50%;
  transition: all 0.2s;
}
.header-logo:hover { opacity: 0.88; }
.header-logo svg { width: 70px; height: 70px; }
.logo-hover-hint {
  position: absolute; inset: 0;
  border-radius: 50%;
  background: rgba(26,107,60,0.7);
  color: #fff; font-size: 9px; font-weight: 700;
  display: flex; align-items: center; justify-content: center;
  opacity: 0; transition: opacity 0.2s;
  pointer-events: none;
}
.header-logo:hover .logo-hover-hint { opacity: 1; }

/* IMPL LIST */
.impl-list { display: flex; flex-direction: column; gap: 5px; }
.impl-item {
  display: flex; align-items: flex-start; gap: 7px;
  font-size: 12px; color: var(--text-mid); line-height: 1.7;
  position: relative;
}
.impl-item:hover .impl-del { opacity: 1; }
.impl-dot {
  width: 7px; height: 7px; border-radius: 50%;
  background: var(--moe-gold);
  flex-shrink: 0; margin-top: 6px;
  box-shadow: 0 0 0 2px rgba(200,151,58,0.2);
}
.impl-text { flex: 1; min-width: 30px; border-radius: 3px; }
.impl-text:focus { outline: none; background: #f0f8f4; padding: 1px 5px; }
.impl-del {
  background: none; border: none; cursor: pointer;
  color: #d06060; font-size: 11px; opacity: 0;
  transition: opacity 0.15s; padding: 2px 3px;
  flex-shrink: 0; margin-top: 2px;
  border-radius: 3px;
}
.impl-del:hover { background: rgba(200,60,60,0.08); }
.impl-add-btn {
  margin-top: 7px;
  display: inline-flex; align-items: center; gap: 5px;
  background: none; border: 1px dashed var(--moe-green2);
  color: var(--moe-green); border-radius: 6px;
  padding: 4px 12px; font-family: var(--font-main);
  font-size: 11.5px; font-weight: 600; cursor: pointer;
  transition: all 0.18s;
}
.impl-add-btn:hover { background: var(--moe-green-lt); }
.header-text { flex: 1; }
.header-kingdom { font-size: 10.5px; color: var(--text-light); font-weight: 500; margin-bottom: 1px; }
.header-ministry { font-size: 14px; font-weight: 700; color: var(--moe-green); margin-bottom: 3px; }
.header-program-label { font-size: 10.5px; color: var(--text-light); margin-bottom: 2px; }
.header-program-name {
  font-size: 18px;
  font-weight: 800;
  color: var(--text-dark);
  line-height: 1.3;
  min-width: 40px;
  border-radius: 4px;
}
.header-program-name:focus {
  outline: none;
  background: #f0f8f4;
  box-shadow: 0 0 0 2px rgba(26,107,60,0.2);
  padding: 2px 6px;
}
.header-date {
  text-align: left;
  flex-shrink: 0;
  font-size: 11px;
  color: var(--text-mid);
  line-height: 2;
}
.header-date strong { color: var(--moe-green); font-weight: 700; }
.date-val { display: inline-block; min-width: 55px; border-radius: 3px; }
.date-val:focus {
  outline: none;
  background: #f0f8f4;
  padding: 1px 4px;
  box-shadow: 0 0 0 2px rgba(26,107,60,0.15);
}

.divider {
  height: 1px;
  background: linear-gradient(to left, transparent, var(--border), transparent);
  margin: 8px 0;
}

/* SECTION TITLE */
.section-title {
  display: flex;
  align-items: center;
  gap: 7px;
  font-size: 12.5px;
  font-weight: 700;
  color: var(--moe-green);
  margin-bottom: 7px;
  padding-bottom: 5px;
  border-bottom: 1.5px solid var(--moe-green-lt);
}
.section-title svg { width: 16px; height: 16px; flex-shrink: 0; }
.section-accent {
  display: inline-block;
  width: 3px; height: 13px;
  background: var(--moe-gold);
  border-radius: 2px;
}

.section-block { margin-bottom: 11px; }

/* DESC BOX */
.desc-box {
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 9px 12px;
  min-height: 60px;
  font-size: 12.5px;
  color: var(--text-mid);
  line-height: 1.85;
  background: #fafcfd;
  transition: all 0.2s;
}
.desc-box:focus {
  outline: none;
  border-color: var(--moe-green2);
  background: #f5fbf7;
  box-shadow: 0 0 0 3px rgba(26,107,60,0.08);
}

/* INFO ROW */
.info-row {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 8px;
  margin-bottom: 11px;
}
.info-cell {
  background: var(--moe-green-lt);
  border: 1px solid rgba(26,107,60,0.15);
  border-radius: 8px;
  padding: 7px 10px;
}
.info-cell-label {
  font-size: 9.5px;
  color: var(--moe-green2);
  font-weight: 700;
  letter-spacing: 0.04em;
  margin-bottom: 2px;
}
.info-cell-val {
  font-size: 12px;
  font-weight: 700;
  color: var(--text-dark);
  min-width: 30px;
}
.info-cell-val:focus {
  outline: none;
  background: rgba(255,255,255,0.7);
  border-radius: 3px;
  padding: 1px 4px;
}

/* TWO COL */
.two-col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 10px;
  margin-bottom: 11px;
}

/* OBJECTIVES */
.objectives-list { display: flex; flex-direction: column; gap: 5px; }
.obj-item { display: flex; align-items: flex-start; gap: 7px; font-size: 12px; color: var(--text-mid); line-height: 1.7; }
.obj-bullet {
  width: 19px; height: 19px;
  border-radius: 50%;
  background: var(--moe-green);
  color: #fff;
  font-size: 9.5px;
  font-weight: 700;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  margin-top: 2px;
}
.obj-text { flex: 1; min-width: 30px; border-radius: 3px; }
.obj-text:focus { outline: none; background: #f0f8f4; padding: 1px 5px; }

/* TABLE */
.activities-table { width: 100%; border-collapse: collapse; font-size: 11.5px; }
.activities-table th {
  background: var(--moe-green);
  color: #fff;
  padding: 6px 9px;
  font-weight: 700;
  font-size: 11px;
  text-align: center;
}
.activities-table th:first-child { border-radius: 0 5px 0 0; }
.activities-table th:last-child { border-radius: 5px 0 0 0; }
.activities-table td {
  padding: 5px 9px;
  border-bottom: 1px solid var(--border);
  color: var(--text-mid);
  text-align: center;
  vertical-align: middle;
}
.activities-table td:focus { outline: none; background: #f0f8f4; }
.activities-table tr:nth-child(even) td { background: #f7fbf9; }
.activities-table tr:hover td { background: var(--moe-green-lt); }
.status-done {
  display: inline-flex; align-items: center; gap: 3px;
  background: rgba(26,107,60,0.1); color: var(--moe-green);
  font-size: 10.5px; font-weight: 600;
  padding: 2px 7px; border-radius: 20px;
}
.status-prog {
  display: inline-flex; align-items: center; gap: 3px;
  background: rgba(200,151,58,0.12); color: var(--moe-gold);
  font-size: 10.5px; font-weight: 600;
  padding: 2px 7px; border-radius: 20px;
}

/* IMAGES */
.images-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 9px;
}
.img-slot {
  aspect-ratio: 4/3;
  border: 1.5px dashed var(--border);
  border-radius: var(--radius);
  background: #f7fafc;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s;
  position: relative;
  overflow: hidden;
}
.img-slot:hover { border-color: var(--moe-green2); background: var(--moe-green-lt); }
.img-slot-icon { width: 26px; height: 26px; color: #b0c4d4; margin-bottom: 5px; transition: color 0.2s; }
.img-slot:hover .img-slot-icon { color: var(--moe-green2); }
.img-slot-label { font-size: 10px; color: #b0c4d4; text-align: center; transition: color 0.2s; }
.img-slot:hover .img-slot-label { color: var(--moe-green); }
.img-slot img {
  position: absolute; inset: 0;
  width: 100%; height: 100%;
  object-fit: cover;
  border-radius: calc(var(--radius) - 2px);
}
.img-slot .remove-btn {
  position: absolute; top: 5px; left: 5px;
  width: 21px; height: 21px;
  border-radius: 50%;
  background: rgba(210,40,40,0.82);
  color: #fff; border: none; cursor: pointer;
  display: none; align-items: center; justify-content: center;
  font-size: 12px; z-index: 5; transition: background 0.15s;
}
.img-slot .remove-btn:hover { background: rgba(190,20,20,1); }
.img-slot:hover .remove-btn { display: flex; }
.img-slot input[type="file"] {
  position: absolute; inset: 0; opacity: 0; cursor: pointer; z-index: 4;
}
.img-slot.has-image input[type="file"] { display: none; }

/* FOOTER */
.page-footer {
  margin-top: auto;
  padding-top: 9px;
  border-top: 1.5px solid var(--moe-green-lt);
}
.footer-sigs {
  display: flex;
  justify-content: space-between;
  align-items: flex-end;
  gap: 20px;
}
.sig-block { text-align: center; }
.sig-label { font-size: 10px; color: var(--text-light); margin-bottom: 5px; font-weight: 600; }
.sig-line { width: 115px; height: 1px; background: var(--border); margin: 0 auto 4px; }
.sig-name {
  font-size: 12px; font-weight: 700; color: var(--text-dark);
  min-width: 50px; display: inline-block; border-radius: 3px;
}
.sig-name:focus {
  outline: none; background: #f0f8f4; padding: 1px 6px;
  box-shadow: 0 0 0 2px rgba(26,107,60,0.15);
}
.stamp-box {
  width: 64px; height: 64px;
  border-radius: 50%;
  border: 1.5px dashed var(--border);
  display: flex; align-items: center; justify-content: center;
  font-size: 9px; color: #bcc8d4; text-align: center; line-height: 1.4;
  margin: 0 auto;
}
.footer-note { text-align: center; margin-top: 7px; font-size: 9.5px; color: #c0cdd8; }
.bottom-stripe {
  height: 4px;
  background: linear-gradient(to left, var(--moe-green), var(--moe-gold), var(--moe-green));
  border-radius: 2px;
  margin-top: 9px;
}

/* PRINT */
@media print {
  @page { size: A4 portrait; margin: 0; }
  body { background: white !important; padding: 0 !important; }
  .toolbar, .edit-hint-bar { display: none !important; }
  .page {
    width: 100%; min-height: 297mm; box-shadow: none !important;
    border-radius: 0 !important; padding: 13mm 13mm 11mm !important;
  }
  .img-slot .remove-btn,
  .img-slot input[type="file"],
  .impl-del, .impl-add-btn,
  .logo-hover-hint { display: none !important; }
  [contenteditable] { border: none !important; box-shadow: none !important; background: transparent !important; }
}

@media screen and (max-width: 230mm) {
  body { padding: 10px 6px 28px; }
  .page { width: 100%; padding: 8mm; }
  .images-grid { grid-template-columns: repeat(2, 1fr); }
  .info-row { grid-template-columns: 1fr 1fr; }
  .two-col { grid-template-columns: 1fr; }
}
</style>
</head>
<body>

<!-- TOOLBAR -->
<div class="toolbar">
  <div class="toolbar-label">
    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5"/><path d="M17.5 2.5a2.121 2.121 0 013 3L12 14l-4 1 1-4 7.5-7.5z"/></svg>
    انقر على أي نص لتعديله مباشرة
  </div>
  <div class="toolbar-actions">
    <button class="btn-reset" onclick="resetPage()">
      <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"/><path d="M3 3v5h5"/></svg>
      إعادة تعيين
    </button>
    <button class="btn-print" onclick="window.print()">
      <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 6 2 18 2 18 9"/><path d="M6 18H4a2 2 0 01-2-2v-5a2 2 0 012-2h16a2 2 0 012 2v5a2 2 0 01-2 2h-2"/><rect x="6" y="14" width="12" height="8" rx="1"/></svg>
      طباعة التقرير
    </button>
  </div>
</div>

<div class="edit-hint-bar">
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
  جميع النصوص والأرقام قابلة للتعديل — انقر عليها مباشرةً | الصور: اضغط على الإطار لرفع صورة من جهازك
</div>

<!-- A4 PAGE -->
<div class="page" id="reportPage">
  <div class="top-stripe"></div>

  <!-- HEADER -->
  <div class="page-header">
    <div class="header-logo" id="logoWrap" onclick="document.getElementById('logoInput').click()" title="انقر لتغيير الشعار">
      <img id="logoImg" src="" alt="شعار الوزارة" style="display:none;width:70px;height:70px;object-fit:contain;border-radius:6px;">
      <svg id="logoDefault" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
        <circle cx="60" cy="60" r="58" fill="#1a6b3c" stroke="#c8973a" stroke-width="3"/>
        <circle cx="60" cy="60" r="50" fill="none" stroke="rgba(255,255,255,0.18)" stroke-width="1.2"/>
        <rect x="57" y="70" width="6" height="20" rx="3" fill="#c8973a"/>
        <path d="M60 70 Q46 55 36 52" stroke="#fff" stroke-width="2.8" fill="none" stroke-linecap="round"/>
        <path d="M60 70 Q74 55 84 52" stroke="#fff" stroke-width="2.8" fill="none" stroke-linecap="round"/>
        <path d="M60 67 Q50 50 44 43" stroke="#fff" stroke-width="2.8" fill="none" stroke-linecap="round"/>
        <path d="M60 67 Q70 50 76 43" stroke="#fff" stroke-width="2.8" fill="none" stroke-linecap="round"/>
        <path d="M60 64 Q60 46 60 38" stroke="#fff" stroke-width="2.8" fill="none" stroke-linecap="round"/>
        <path d="M33 90 L51 72" stroke="#c8973a" stroke-width="2.2" stroke-linecap="round"/>
        <path d="M87 90 L69 72" stroke="#c8973a" stroke-width="2.2" stroke-linecap="round"/>
        <circle cx="33" cy="92" r="3" fill="#c8973a"/>
        <circle cx="87" cy="92" r="3" fill="#c8973a"/>
        <text x="60" y="28" text-anchor="middle" font-size="13" fill="#c8973a">✦</text>
        <text x="60" y="110" text-anchor="middle" font-size="7" fill="#fff" font-family="Cairo,sans-serif" font-weight="700">وزارة التعليم</text>
      </svg>
      <div class="logo-hover-hint">تغيير الشعار</div>
      <input type="file" id="logoInput" accept="image/*" style="display:none" onchange="changeLogo(event)">
    </div>

    <div class="header-text">
      <div class="header-kingdom">المملكة العربية السعودية — وزارة التعليم</div>
      <div class="header-ministry" contenteditable="true" id="ministryName">إدارة تعليم الرياض — نماذج التقارير المدرسية</div>
      <div class="header-program-label">اسم البرنامج / المبادرة:</div>
      <div class="header-program-name" contenteditable="true" id="programName">برنامج مدرستي — تعزيز التميز الأكاديمي</div>
    </div>

    <div class="header-date">
      <div>التاريخ: <strong><span contenteditable="true" class="date-val" id="d1">١٤٤٦/٠٨/١٢ هـ</span></strong></div>
      <div>العام الدراسي: <strong><span contenteditable="true" class="date-val" id="d2">١٤٤٦ / ١٤٤٧ هـ</span></strong></div>
      <div>الفصل الدراسي: <strong><span contenteditable="true" class="date-val" id="d3">الثاني</span></strong></div>
      <div>رقم التقرير: <strong><span contenteditable="true" class="date-val" id="d4">٠٠٣</span></strong></div>
    </div>
  </div>

  <!-- META INFO -->
  <div class="info-row">
    <div class="info-cell">
      <div class="info-cell-label">اسم المدرسة</div>
      <div class="info-cell-val" contenteditable="true">مدرسة الفيصل الابتدائية</div>
    </div>
    <div class="info-cell">
      <div class="info-cell-label">المرحلة الدراسية</div>
      <div class="info-cell-val" contenteditable="true">ابتدائي — الصفوف ٣ و ٤ و ٥</div>
    </div>
    <div class="info-cell">
      <div class="info-cell-label">إدارة التعليم</div>
      <div class="info-cell-val" contenteditable="true">إدارة تعليم الرياض</div>
    </div>
  </div>

  <!-- DESCRIPTION -->
  <div class="section-block">
    <div class="section-title">
      <span class="section-accent"></span>
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>
      وصف البرنامج وأهدافه
    </div>
    <div class="desc-box" contenteditable="true">يهدف برنامج "مدرستي" إلى رفع مستوى التحصيل الدراسي وتعزيز الانتماء المدرسي لدى الطلاب، من خلال تفعيل الأنشطة التعليمية والتربوية المتكاملة، ودعم البيئة المدرسية المحفزة للإبداع والتميز. ويشمل البرنامج خططًا تنفيذية واضحة تضمن مشاركة الطلاب وأولياء الأمور والمجتمع المدرسي بشكل فعّال ومنتظم طوال العام الدراسي.</div>
  </div>

  <!-- TWO COL -->
  <div class="two-col">
    <div>
      <div class="section-title">
        <span class="section-accent"></span>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><circle cx="12" cy="12" r="6"/><circle cx="12" cy="12" r="2"/></svg>
        الأهداف التنفيذية
      </div>
      <div class="objectives-list">
        <div class="obj-item"><div class="obj-bullet">١</div><div class="obj-text" contenteditable="true">تحسين نسبة الحضور والانتظام المدرسي بنسبة ٩٠٪.</div></div>
        <div class="obj-item"><div class="obj-bullet">٢</div><div class="obj-text" contenteditable="true">تطوير المهارات القرائية والحسابية لدى الطلاب.</div></div>
        <div class="obj-item"><div class="obj-bullet">٣</div><div class="obj-text" contenteditable="true">تفعيل الأنشطة اللاصفية الداعمة للموهبة والإبداع.</div></div>
        <div class="obj-item"><div class="obj-bullet">٤</div><div class="obj-text" contenteditable="true">تعزيز شراكة أولياء الأمور في العملية التعليمية.</div></div>
      </div>
    </div>

    <div>
      <div class="section-title">
        <span class="section-accent"></span>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11"/></svg>
        آلية التنفيذ
      </div>
      <div class="impl-list" id="implList">
        <div class="impl-item">
          <div class="impl-dot"></div>
          <div class="impl-text" contenteditable="true">تشكيل فريق تنفيذي من المعلمين والإداريين المختصين بإشراف مباشر من القيادة المدرسية.</div>
          <button class="impl-del" onclick="delImpl(this)" title="حذف">✕</button>
        </div>
        <div class="impl-item">
          <div class="impl-dot"></div>
          <div class="impl-text" contenteditable="true">إعداد خطة زمنية واضحة لتنفيذ الأنشطة والفعاليات على مدار الفصل الدراسي.</div>
          <button class="impl-del" onclick="delImpl(this)" title="حذف">✕</button>
        </div>
        <div class="impl-item">
          <div class="impl-dot"></div>
          <div class="impl-text" contenteditable="true">تخصيص ميزانية مناسبة للبرنامج وتوزيع الموارد على الأنشطة وفق الأولويات.</div>
          <button class="impl-del" onclick="delImpl(this)" title="حذف">✕</button>
        </div>
        <div class="impl-item">
          <div class="impl-dot"></div>
          <div class="impl-text" contenteditable="true">متابعة التنفيذ دورياً وقياس مؤشرات الأداء ورفع تقارير دورية للإدارة العليا.</div>
          <button class="impl-del" onclick="delImpl(this)" title="حذف">✕</button>
        </div>
        <div class="impl-item">
          <div class="impl-dot"></div>
          <div class="impl-text" contenteditable="true">توثيق جميع الأنشطة بالصور والتقارير وإشراك أولياء الأمور في الفعاليات الكبرى.</div>
          <button class="impl-del" onclick="delImpl(this)" title="حذف">✕</button>
        </div>
      </div>
      <button class="impl-add-btn" onclick="addImpl()">+ إضافة نقطة</button>
    </div>
  </div>

  <!-- IMAGES -->
  <div class="section-block">
    <div class="section-title">
      <span class="section-accent"></span>
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>
      توثيق صور التنفيذ
    </div>
    <div class="images-grid">
      <div class="img-slot" id="s0">
        <svg class="img-slot-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>
        <div class="img-slot-label">رفع صورة ١</div>
        <input type="file" accept="image/*" onchange="loadImg(event,0)">
        <button class="remove-btn" onclick="removeImg(event,0)">✕</button>
      </div>
      <div class="img-slot" id="s1">
        <svg class="img-slot-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>
        <div class="img-slot-label">رفع صورة ٢</div>
        <input type="file" accept="image/*" onchange="loadImg(event,1)">
        <button class="remove-btn" onclick="removeImg(event,1)">✕</button>
      </div>
      <div class="img-slot" id="s2">
        <svg class="img-slot-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>
        <div class="img-slot-label">رفع صورة ٣</div>
        <input type="file" accept="image/*" onchange="loadImg(event,2)">
        <button class="remove-btn" onclick="removeImg(event,2)">✕</button>
      </div>
      <div class="img-slot" id="s3">
        <svg class="img-slot-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>
        <div class="img-slot-label">رفع صورة ٤</div>
        <input type="file" accept="image/*" onchange="loadImg(event,3)">
        <button class="remove-btn" onclick="removeImg(event,3)">✕</button>
      </div>
    </div>
  </div>

  <!-- NOTES -->
  <div class="section-block">
    <div class="section-title">
      <span class="section-accent"></span>
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 4H4a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 013 3L12 15l-4 1 1-4 7.5-7.5z"/></svg>
      ملاحظات ومقترحات
    </div>
    <div class="desc-box" contenteditable="true" style="min-height:44px">تم تنفيذ البرنامج بصورة منتظمة وفق الخطة المعتمدة، مع تسجيل نسبة مشاركة ٩٢٪ من الطلاب في فعاليات الفصل الثاني. يُقترح توسيع نطاق الشراكة المجتمعية في الفصل القادم لتعزيز الأثر وتحقيق الأهداف بكفاءة أعلى.</div>
  </div>

  <!-- FOOTER -->
  <div class="page-footer">
    <div class="footer-sigs">
      <div class="sig-block">
        <div class="sig-label">مدير / مديرة المدرسة</div>
        <div class="sig-line"></div>
        <span class="sig-name" contenteditable="true" id="principalName">أ. سعد بن عبدالرحمن العمري</span>
      </div>
      <div class="sig-block">
        <div class="stamp-box">ختم<br>المدرسة</div>
      </div>
      <div class="sig-block">
        <div class="sig-label">معد / معدة التقرير</div>
        <div class="sig-line"></div>
        <span class="sig-name" contenteditable="true" id="authorName">أ. نوف بنت خالد الشمري</span>
      </div>
    </div>
    <div class="footer-note">وثيقة رسمية — لا يُعتد بها إلا بتوقيع مدير المدرسة وختمها الرسمي</div>
    <div class="bottom-stripe"></div>
  </div>

</div><!-- /page -->

<script>
/* ── LOGO CHANGE ── */
function changeLogo(e) {
  const f = e.target.files[0];
  if (!f) return;
  const reader = new FileReader();
  reader.onload = ev => {
    const img = document.getElementById('logoImg');
    const svg = document.getElementById('logoDefault');
    img.src = ev.target.result;
    img.style.display = 'block';
    svg.style.display = 'none';
  };
  reader.readAsDataURL(f);
}
function resetLogo() {
  document.getElementById('logoImg').style.display = 'none';
  document.getElementById('logoDefault').style.display = '';
  document.getElementById('logoInput').value = '';
}

/* ── IMAGE SLOTS ── */
function loadImg(e, i) {
  const f = e.target.files[0];
  if (!f) return;
  const slot = document.getElementById('s' + i);
  const r = new FileReader();
  r.onload = ev => {
    let img = slot.querySelector('img');
    if (!img) { img = document.createElement('img'); slot.appendChild(img); }
    img.src = ev.target.result;
    slot.classList.add('has-image');
    slot.querySelector('.img-slot-icon').style.display = 'none';
    slot.querySelector('.img-slot-label').style.display = 'none';
  };
  r.readAsDataURL(f);
}
function removeImg(e, i) {
  e.stopPropagation();
  const slot = document.getElementById('s' + i);
  const img = slot.querySelector('img');
  if (img) img.remove();
  slot.classList.remove('has-image');
  slot.querySelector('.img-slot-icon').style.display = '';
  slot.querySelector('.img-slot-label').style.display = '';
  const inp = slot.querySelector('input[type="file"]');
  if (inp) inp.value = '';
}

/* ── IMPL LIST ── */
function addImpl() {
  const list = document.getElementById('implList');
  const item = document.createElement('div');
  item.className = 'impl-item';
  item.innerHTML = `<div class="impl-dot"></div><div class="impl-text" contenteditable="true">اكتب نقطة التنفيذ هنا...</div><button class="impl-del" onclick="delImpl(this)" title="حذف">✕</button>`;
  list.appendChild(item);
  item.querySelector('.impl-text').focus();
}
function delImpl(btn) {
  const item = btn.closest('.impl-item');
  if (document.querySelectorAll('.impl-item').length > 1) {
    item.remove();
  } else {
    item.querySelector('.impl-text').textContent = '';
    item.querySelector('.impl-text').focus();
  }
}

/* ── RESET ── */
const DEF = {
  programName: 'برنامج مدرستي — تعزيز التميز الأكاديمي',
  ministryName: 'إدارة تعليم الرياض — نماذج التقارير المدرسية',
  d1: '١٤٤٦/٠٨/١٢ هـ', d2: '١٤٤٦ / ١٤٤٧ هـ',
  d3: 'الثاني', d4: '٠٠٣',
  principalName: 'أ. سعد بن عبدالرحمن العمري',
  authorName: 'أ. نوف بنت خالد الشمري'
};
function resetPage() {
  if (!confirm('هل تريد إعادة تعيين البيانات إلى القيم الافتراضية؟')) return;
  Object.entries(DEF).forEach(([id, v]) => { const el = document.getElementById(id); if (el) el.textContent = v; });
  [0,1,2,3].forEach(i => removeImg({ stopPropagation: ()=>{} }, i));
  resetLogo();
}
</script>
</body>
</html>
