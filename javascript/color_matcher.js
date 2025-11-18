
/* ===================== Color Functions ===================== */
function hexToRgb(hex){
  const n = parseInt(hex.replace("#",""),16);
  return { r:(n>>16)&255, g:(n>>8)&255, b:n&255 };
}
function rgbToHex(r,g,b){
  return "#"+[r,g,b].map(c=>c.toString(16).padStart(2,"0")).join("").toUpperCase();
}
function rgbToHsl(r,g,b){
  r/=255; g/=255; b/=255;
  let max=Math.max(r,g,b), min=Math.min(r,g,b);
  let h=0, s=0, l=(max+min)/2;
  if(max!==min){
    let d=max-min;
    s = l>0.5 ? d/(2-max-min) : d/(max+min);
    switch(max){
      case r: h=(g-b)/d + (g<b?6:0); break;
      case g: h=(b-r)/d +2; break;
      case b: h=(r-g)/d +4; break;
    }
    h*=60;
  }
  return {h, s:s*100, l:l*100};
}
function hslToHex(h,s,l){
  s/=100; l/=100;
  const k=n=>(n + h/30) % 12;
  const a = s * Math.min(l, 1-l);
  const f=n => l - a * Math.max(-1, Math.min(k(n)-3, Math.min(9-k(n),1)));
  return rgbToHex(Math.round(f(0)*255), Math.round(f(8)*255), Math.round(f(4)*255));
}
function clampHue(h){ return ((h % 360) + 360) % 360; }

/* ===================== Generate Color Sets ===================== */
function generateColors(hex){
  const {r,g,b}=hexToRgb(hex);
  const {h,s,l}=rgbToHsl(r,g,b);
  return {
    base: [hex],
    analogous: [hslToHex(clampHue(h+30),s,l), hslToHex(clampHue(h-30),s,l)],
    triadic: [hslToHex(clampHue(h+120),s,l), hslToHex(clampHue(h-120),s,l)],
    split: [hslToHex(clampHue(h+150),s,l), hslToHex(clampHue(h-150),s,l)],
    tints: [hslToHex(h,s,l+10), hslToHex(h,s,l+25)],
    shades: [hslToHex(h,s,l-10), hslToHex(h,s,l-25)]
  };
}

/* ===================== Rendering ===================== */
let currentColors = generateColors("#66d7d1");
let activeTypes = { base:true, analogous:false, triadic:false, split:false, tints:false, shades:false };

function renderAll(){
  const display = document.getElementById("colorDisplay");
  if(!display) return;
  display.innerHTML = "";
  for(let type in activeTypes){
    if(activeTypes[type]){
      currentColors[type].forEach(c=>{
        const box = document.createElement("div");
        box.className = "w-1/5 h-48 flex items-end justify-center text-white font-bold swatch";
        box.style.background = c;
        box.innerHTML = `<div class="w-full text-center bg-black/40 py-1">${c}</div>`;
        display.appendChild(box);
      });
    }
  }
}

/* ===================== Events ===================== */
document.addEventListener("DOMContentLoaded", ()=>{
  const picker = document.getElementById("baseColor");
  if(!picker) return;
  picker.addEventListener("input", ()=>{
    currentColors = generateColors(picker.value);
    document.getElementById("hexText").textContent = picker.value.toUpperCase();
    renderAll();
  });

  document.querySelectorAll(".type-btn").forEach(btn=>{
    btn.addEventListener("click", ()=>{
      const type = btn.dataset.type;
      activeTypes[type] = !activeTypes[type];
      btn.classList.toggle("btn-active");
      renderAll();
    });
  });

  document.getElementById("hexText").textContent = picker.value.toUpperCase();
  renderAll();
});

