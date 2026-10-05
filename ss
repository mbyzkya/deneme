<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Müslüman Komutanlar: Büyük Müzayede</title>
    <style>
  @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap');
  :root {
    --gold: #64decf;
    --gold-bright: #f2d99d;
    --gold-deep: #9b7135;
    --ink: #0a1017;
    --panel: #111a23;
    --panel-light: #192632;
    --muted: #9aa7b2;
    --p1-color: #69b7c8;
    --p2-color: #dc8f6e;
    --accent-green: #72b69b;
    --glass: rgba(18, 28, 37, .9);
  }
  * { box-sizing: border-box; }
  body {
    font-family: 'Manrope', sans-serif;
    color: #f5f1e7; margin: 0; min-height: 100vh; padding: 24px;
    display: flex; justify-content: center; align-items: center; overflow-x: hidden;
    background:
      radial-gradient(ellipse at 50% 0%, rgba(117, 87, 42, .19), transparent 42%),
      radial-gradient(ellipse at 8% 85%, rgba(45, 102, 113, .12), transparent 34%),
      linear-gradient(145deg, #111a22 0%, #080d13 64%, #0d131a 100%);
  }
  body::before {
    content: ''; position: fixed; inset: 0; pointer-events: none; opacity: .15;
    background-image: linear-gradient(30deg, transparent 49.5%, rgba(100,222,207,.12) 50%, transparent 50.5%),
      linear-gradient(150deg, transparent 49.5%, rgba(100,222,207,.09) 50%, transparent 50.5%);
    background-size: 68px 68px; mask-image: linear-gradient(to bottom, #000, transparent 78%);
  }
  #game-ui {
    width: min(1120px, 100%); min-height: min(860px, calc(100vh - 48px));
    display: flex; flex-direction: column; gap: 16px; position: relative;
  }
  .topbar { display: flex; align-items: center; gap: 14px; min-height: 58px; padding: 0 4px; }
  .brand-mark {
    width: 46px; height: 46px; border: 1px solid rgba(100,222,207,.52); border-radius: 14px;
    display: grid; place-items: center; color: var(--gold-bright); font-size: 22px;
    background: linear-gradient(145deg, rgba(100,222,207,.17), rgba(100,222,207,.035));
    box-shadow: inset 0 0 18px rgba(100,222,207,.08);
  }
  .topbar-copy { flex: 1; }
  .topbar .eyebrow { color: var(--gold); font-size: .62rem; letter-spacing: .24em; font-weight: 800; }
  .topbar h1 { margin: 2px 0 0; font: 700 1.22rem 'Cinzel', serif; letter-spacing: .035em; }
  .topbar-note { display: inline-flex; align-items: center; gap: 9px; color: #c5d0d6; font-size: .68rem; letter-spacing: .14em; font-weight: 800; }
  .live-dot { width: 8px; height: 8px; border-radius: 50%; background: var(--accent-green); box-shadow: 0 0 12px rgba(114,182,155,.8); }
  .player-header { display: flex; gap: 14px; }
  .player-box {
    flex: 1; display: grid; grid-template-columns: 1fr auto; grid-template-rows: auto auto;
    align-items: center; text-align: left; position: relative; overflow: hidden;
    padding: 17px 21px; min-height: 108px; border-radius: 16px;
    background: linear-gradient(120deg, rgba(24,37,48,.97), rgba(15,24,32,.97));
    border: 1px solid rgba(255,255,255,.075); border-bottom: 2px solid #35414a;
    transition: border-color .25s, box-shadow .25s, transform .25s, background .25s;
  }
  .player-box::before { content: ''; position: absolute; inset: 0 auto 0 0; width: 3px; background: var(--player-color); opacity: .78; }
  .player-box::after { content: ''; position: absolute; width: 140px; height: 140px; right: -55px; top: -65px; border: 1px solid color-mix(in srgb, var(--player-color), transparent 76%); border-radius: 50%; box-shadow: 0 0 0 14px color-mix(in srgb, var(--player-color), transparent 94%), 0 0 0 28px color-mix(in srgb, var(--player-color), transparent 96%); }
  .player-box.p1 { --player-color: var(--p1-color); }
  .player-box.p2 { --player-color: var(--p2-color); }
  .player-box.active { transform: translateY(-2px); background: linear-gradient(120deg, rgba(30,47,59,.98), rgba(17,27,36,.98)); border-color: color-mix(in srgb, var(--player-color), transparent 54%); box-shadow: 0 10px 28px rgba(0,0,0,.24), 0 0 24px color-mix(in srgb, var(--player-color), transparent 90%); }
  .player-name { grid-column: 1; grid-row: 1; font: 700 .86rem 'Cinzel', serif; letter-spacing: .11em; color: #d8e1e3; margin-bottom: 7px; }
  .budget-val { grid-column: 2; grid-row: 1 / span 2; position: relative; z-index: 1; font-size: 2.2rem; line-height: 1; font-weight: 800; color: #fbf5e8; }
  .budget-val span:last-child { font-size: .72rem !important; letter-spacing: .13em; margin-left: 7px; color: var(--gold) !important; }
  .budget-label { grid-column: 1; grid-row: 2; font-size: .7rem; color: var(--muted); letter-spacing: .025em; }
  #auction-stage {
    flex: 1; min-height: 500px; display: grid; grid-template-columns: minmax(300px, .9fr) minmax(0, 1.1fr); gap: 16px;
    padding: 16px; border-radius: 22px; background: var(--glass); border: 1px solid rgba(255,255,255,.085);
    box-shadow: 0 24px 70px rgba(0,0,0,.3), inset 0 1px rgba(255,255,255,.035); backdrop-filter: blur(14px);
  }
  .commander-card-visual {
    isolation: isolate; overflow: hidden; min-width: 0; width: auto; padding: 26px 24px 22px;
    display: flex; flex-direction: column; align-items: center; position: relative; border-radius: 17px;
    border: 1px solid rgba(100,222,207,.58);
    background: radial-gradient(ellipse at 50% 36%, rgba(39,111,116,.19), transparent 48%), linear-gradient(155deg, #1b2830, #101820 68%, #131c22);
    box-shadow: inset 0 0 0 5px rgba(100,222,207,.035), 0 12px 30px rgba(0,0,0,.25);
  }
  .commander-card-visual::before { content: ''; position: absolute; z-index: -1; width: 260px; height: 310px; top: 78px; left: 50%; transform: translateX(-50%); border: 1px solid rgba(100,222,207,.16); border-radius: 140px 140px 18px 18px; box-shadow: 0 0 0 10px rgba(100,222,207,.025), 0 0 0 22px rgba(100,222,207,.02); background: linear-gradient(180deg, rgba(100,222,207,.035), transparent 70%); }
  .commander-card-visual::after { content: '✦'; position: absolute; z-index: -1; right: 19px; bottom: 14px; color: rgba(100,222,207,.28); font-size: 32px; }
  .card-header { width: 100%; text-align: center; padding-bottom: 14px; margin-bottom: 12px; border-bottom: 1px solid rgba(100,222,207,.34); }
  .era-tag { color: var(--gold); font-size: .65rem; letter-spacing: .2em; font-weight: 800; text-transform: uppercase; }
  #comm-era { letter-spacing: .08em; line-height: 1.4; }
  .name-tag { max-width: 100%; margin: 8px 0 0; font: 700 clamp(1.25rem, 2vw, 1.72rem) 'Cinzel', serif; color: #fbf1dc; line-height: 1.25; text-shadow: 0 2px 18px rgba(100,222,207,.16); }
  .commander-portrait { width: 166px; height: 178px; margin: 8px 0 9px; overflow: hidden; border: 1px solid rgba(100,222,207,.5); border-radius: 84px 84px 15px 15px; background: #192b32; box-shadow: 0 0 0 7px rgba(100,222,207,.045), 0 10px 28px rgba(0,0,0,.35); }
  .commander-portrait svg { display: block; width: 100%; height: 100%; }
  .stat-circle-row { display: flex; gap: 12px; margin: 15px 0 18px; }
  .stat-item { text-align: center; background: rgba(6,11,15,.48); width: 66px; height: 66px; border-radius: 50%; display: flex; flex-direction: column; justify-content: center; border: 1px solid rgba(100,222,207,.28); box-shadow: inset 0 0 12px rgba(100,222,207,.04); }
  .stat-item .val { color: #fff3d8; font-weight: 800; font-size: 1.05rem; }
  .stat-item .lab { color: #a9b2b4; font-size: .56rem; letter-spacing: .1em; font-weight: 800; }
  .card-caption { margin-top: auto; padding-top: 8px; color: rgba(100,222,207,.8); font-size: .61rem; font-weight: 800; letter-spacing: .25em; }
  .bid-info-panel { min-width: 0; display: flex; flex-direction: column; justify-content: space-between; align-items: center; padding: 12px 18px 8px; }
  .round-status { align-self: stretch; display: flex; justify-content: center; gap: 12px; padding: 10px 12px; border-bottom: 1px solid rgba(255,255,255,.08); font: 700 .77rem 'Cinzel', serif; color: #d8c18e; letter-spacing: .08em; text-align: center; }
  .round-status span { color: #fff5df; }
  .timer-display { width: 118px; height: 118px; flex: 0 0 auto; border: 1px solid rgba(100,222,207,.65); border-radius: 50%; display: flex; justify-content: center; align-items: center; font-size: 3.2rem; font-weight: 800; margin: 16px 0; background: radial-gradient(circle, rgba(100,222,207,.11), rgba(8,13,18,.5) 69%); color: var(--gold-bright); box-shadow: 0 0 0 7px rgba(100,222,207,.045), 0 0 30px rgba(100,222,207,.1), inset 0 0 20px rgba(100,222,207,.06); font-variant-numeric: tabular-nums; }
  .current-offer-box { text-align: center; width: min(100%, 430px); padding: 17px 20px 15px; border-radius: 16px; border: 1px solid rgba(100,222,207,.31); background: linear-gradient(145deg, rgba(6,12,17,.68), rgba(22,31,39,.76)); box-shadow: inset 0 1px rgba(255,255,255,.035); }
  .offer-val { margin: 5px 0 1px; font-size: 3rem; line-height: 1.05; font-weight: 800; color: var(--accent-green); text-shadow: 0 0 24px rgba(114,182,155,.16); font-variant-numeric: tabular-nums; }
  #bidder-status { color: #a9b7ba; letter-spacing: .12em; font-size: .58rem; }
  #turn-announce { padding: 8px 15px; margin: 8px 0 0 !important; color: var(--gold-bright) !important; font: 700 .83rem 'Cinzel', serif !important; letter-spacing: .1em; }
  .action-area { display: grid; grid-template-columns: repeat(4, minmax(70px, 1fr)); gap: 9px; width: 100%; margin-top: 12px; }
  .btn { min-height: 50px; padding: 12px 14px; border-radius: 11px; border: 1px solid transparent; cursor: pointer; transition: transform .16s, filter .16s, box-shadow .16s, border-color .16s; font: 800 .86rem 'Manrope', sans-serif; letter-spacing: .03em; }
  .btn:focus-visible { outline: 2px solid var(--gold-bright); outline-offset: 3px; }
  .btn-bid { color: #07120f; background: linear-gradient(145deg, #91cfb2, #5d9f83); border-color: rgba(193,240,216,.3); box-shadow: inset 0 1px rgba(255,255,255,.35), 0 5px 14px rgba(0,0,0,.22); }
  .btn-bid:hover { transform: translateY(-2px); filter: brightness(1.08); box-shadow: 0 8px 20px rgba(83,158,126,.2); }
  .btn:active { transform: translateY(1px); }
  .btn-bid:disabled { background: #46534f; color: #a0aaa5; cursor: not-allowed; box-shadow: none; }
  .btn-pass { color: #e4d9c7; background: linear-gradient(145deg, #34404a, #222c34); border-color: rgba(255,255,255,.1); }
  .btn-pass:hover { border-color: rgba(255,255,255,.25); filter: brightness(1.12); }
  #stamp { position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%) rotate(-13deg) scale(4); padding: 18px 34px; z-index: 100; pointer-events: none; white-space: nowrap; opacity: 0; border: 4px double #69ded1; border-radius: 8px; color: #dcfff7; background: rgba(8,13,18,.94); box-shadow: 0 12px 50px rgba(0,0,0,.6); font: 700 clamp(1.6rem, 6vw, 4.5rem) 'Cinzel', serif; letter-spacing: .06em; }
  @keyframes stampAnim { 0% { transform: translate(-50%,-50%) rotate(-13deg) scale(4); opacity: 0; } 65% { transform: translate(-50%,-50%) rotate(-13deg) scale(1); opacity: 1; } 100% { transform: translate(-50%,-50%) rotate(-13deg) scale(1); opacity: 1; } }
  .show-stamp { animation: stampAnim .48s forwards; }
  .hidden { display: none !important; }
  #final-screen { position: absolute; inset: 0; border: 1px solid rgba(100,222,207,.32); border-radius: 22px; background: rgba(7,12,17,.96); display: flex; flex-direction: column; justify-content: center; align-items: center; z-index: 200; padding: 24px; text-align: center; backdrop-filter: blur(16px); }
  #final-screen h1 { margin: 0 0 12px; font: 700 clamp(2rem, 6vw, 4rem) 'Cinzel', serif !important; color: var(--gold-bright) !important; }
  #round-summary { color: #b8c3c7; }
  #final-screen .btn { min-height: 60px; padding: 17px 30px !important; color: #07120f; }
  @media (max-width: 760px) {
    body { padding: 14px; align-items: flex-start; }
    #game-ui { min-height: calc(100vh - 28px); gap: 12px; }
    .topbar { min-height: 48px; gap: 10px; }
    .brand-mark { width: 40px; height: 40px; border-radius: 12px; }
    .topbar h1 { font-size: 1rem; }
    .topbar .eyebrow { font-size: .52rem; }
    .topbar-note { font-size: .55rem; letter-spacing: .07em; }
    .player-header { gap: 10px; }
    .player-box { min-height: 88px; padding: 13px 14px; }
    .player-name { font-size: .69rem; letter-spacing: .06em; }
    .budget-val { font-size: 1.65rem; }
    .budget-label { font-size: .59rem; }
    #auction-stage { grid-template-columns: minmax(0, .88fr) minmax(0, 1.12fr); min-height: 435px; padding: 11px; gap: 11px; }
    .commander-card-visual { padding: 19px 12px 14px; }
    .commander-portrait { width: 134px; height: 151px; }
    .stat-circle-row { gap: 6px; }
    .stat-item { width: 53px; height: 53px; }
    .bid-info-panel { padding: 8px 3px 5px; }
    .round-status { font-size: .62rem; gap: 7px; padding: 9px 2px; }
    .timer-display { width: 94px; height: 94px; font-size: 2.7rem; margin: 12px 0; }
    .current-offer-box { padding: 14px 8px; }
    .offer-val { font-size: 2.5rem; }
    .action-area { grid-template-columns: repeat(2, 1fr); gap: 8px; }
    .btn { min-height: 44px; padding: 10px 8px; font-size: .76rem; }
  }
  @media (max-width: 520px) {
    .topbar-note { display: none; }
    .player-box { display: flex; flex-direction: column; align-items: flex-start; min-height: 100px; padding: 12px; }
    .player-name { margin-bottom: 5px; }
    .budget-val { font-size: 1.45rem; }
    .budget-label { margin-top: 4px; }
    #auction-stage { display: flex; flex-direction: column; min-height: 0; }
    .commander-card-visual { min-height: 390px; }
    .commander-portrait { width: 130px; height: 148px; }
    .bid-info-panel { gap: 8px; padding: 8px 5px 5px; }
    .timer-display { margin: 10px 0 5px; }
    .current-offer-box { width: 100%; }
    .action-area { margin-top: 4px; }
  }
  .screen-overlay { position: absolute; inset: 0; z-index: 300; display: flex; align-items: center; justify-content: center; overflow-y: auto; padding: 20px; border: 1px solid rgba(100,222,207,.32); border-radius: 22px; background: rgba(7,12,17,.965); backdrop-filter: blur(18px); }
  .start-panel { width: min(560px, 100%); padding: clamp(24px, 5vw, 46px); text-align: center; border: 1px solid rgba(100,222,207,.38); border-radius: 22px; background: radial-gradient(ellipse at 50% 0%, rgba(100,222,207,.13), transparent 60%), linear-gradient(145deg, #17232b, #0e151c); box-shadow: inset 0 0 0 6px rgba(100,222,207,.025), 0 22px 70px rgba(0,0,0,.48); }
  .start-sigil { width: 78px; height: 78px; margin: 0 auto 18px; display: grid; place-items: center; border: 1px solid rgba(100,222,207,.55); border-radius: 50%; color: var(--gold-bright); font-size: 2.4rem; background: rgba(100,222,207,.07); box-shadow: 0 0 0 8px rgba(100,222,207,.035), 0 0 32px rgba(100,222,207,.12); }
  .start-panel .eyebrow, .results-kicker { color: var(--gold); font-size: .64rem; font-weight: 800; letter-spacing: .23em; }
  .start-panel h2 { margin: 9px 0 12px; color: #fbf1dc; font: 700 clamp(1.8rem, 5vw, 2.6rem) 'Cinzel', serif; }
  .start-panel p { margin: 0 auto 24px; max-width: 420px; color: #b8c4c8; font-size: .92rem; line-height: 1.75; }
  #start-game-button { min-width: 220px; min-height: 58px; color: #07120f; font-size: .94rem; letter-spacing: .08em; }
  .results-panel { width: min(980px, 100%); margin: auto; display: flex; flex-direction: column; gap: 11px; }
  .results-heading { text-align: center; }
  .results-heading h2 { margin: 4px 0 2px; color: var(--gold-bright); font: 700 clamp(1.8rem, 4vw, 2.8rem) 'Cinzel', serif; }
  #round-summary { margin: 0; color: #afbdc2; font-size: .84rem; }
  .team-verdict { padding: 11px 14px; text-align: center; border: 1px solid rgba(100,222,207,.35); border-radius: 12px; color: #f4dfad; background: rgba(100,222,207,.075); font: 700 .85rem 'Cinzel', serif; letter-spacing: .035em; }
  .team-score-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; }
  .team-score { padding: 12px 15px; border: 1px solid rgba(255,255,255,.1); border-radius: 13px; background: rgba(255,255,255,.035); text-align: left; }
  .team-score.p1 { border-left: 3px solid var(--p1-color); }
  .team-score.p2 { border-left: 3px solid var(--p2-color); }
  .team-score.winner { background: rgba(100,222,207,.09); border-color: rgba(100,222,207,.42); }
  .team-score-head { display: flex; justify-content: space-between; gap: 8px; align-items: center; color: #e7e1d5; font: 700 .72rem 'Cinzel', serif; letter-spacing: .06em; }
  .team-score-head small { color: var(--gold); font: 800 .55rem 'Manrope', sans-serif; letter-spacing: .12em; }
  .team-score-val { display: block; margin: 5px 0 1px; color: #fff2d6; font-size: 1.65rem; line-height: 1; font-weight: 800; font-variant-numeric: tabular-nums; }
  .team-score-meta { color: #9eabb1; font-size: .65rem; }
  .results-table-wrap { max-height: min(35vh, 290px); overflow: auto; border: 1px solid rgba(255,255,255,.1); border-radius: 12px; background: rgba(4,9,13,.35); }
  .results-table { width: 100%; border-collapse: collapse; white-space: nowrap; text-align: left; font-size: .71rem; }
  .results-table th { position: sticky; top: 0; z-index: 1; padding: 10px 11px; color: var(--gold); background: #17232b; font-size: .59rem; letter-spacing: .1em; }
  .results-table td { padding: 8px 11px; border-top: 1px solid rgba(255,255,255,.055); color: #d6dfe0; }
  .results-table tbody tr.p1-row td:first-child { border-left: 2px solid var(--p1-color); }
  .results-table tbody tr.p2-row td:first-child { border-left: 2px solid var(--p2-color); }
  .results-table tbody tr.unowned td { color: #849197; }
  .results-table td:last-child { color: #f3dca9; font-weight: 800; }
  #final-screen { justify-content: flex-start; overflow-y: auto; }
  #final-screen .btn { align-self: center; margin-top: 1px; }
  @media (max-width: 520px) {
    .screen-overlay { padding: 12px; border-radius: 17px; }
    .start-panel { padding: 26px 18px; }
    .team-score-grid { gap: 7px; }
    .team-score { padding: 10px; }
    .team-score-val { font-size: 1.4rem; }
    .team-score-head { font-size: .64rem; }
    .results-table { font-size: .65rem; }
    .results-table th, .results-table td { padding: 8px; }
    .results-table-wrap { max-height: 34vh; }
  }
  @media (prefers-reduced-motion: reduce) { *, *::before, *::after { scroll-behavior: auto !important; transition-duration: .01ms !important; animation-duration: .01ms !important; } }
  :root { --gold: #64decf; --gold-bright: #d5fff7; --gold-deep: #237f79; --p1-color: #53d5c7; --p2-color: #ff987c; --accent-green: #78ddb3; --glass: rgba(19,29,42,.92); }
  body { background: radial-gradient(ellipse at 50% -10%, rgba(67,132,158,.24), transparent 44%), radial-gradient(ellipse at 90% 90%, rgba(64,139,128,.1), transparent 35%), #0b111b; color: #edf3f6; }
  body::before { opacity: .12; background-image: radial-gradient(rgba(210,232,242,.55) .6px, transparent .7px); background-size: 24px 24px; mask-image: linear-gradient(to bottom, #000, transparent 80%); }
  .topbar h1, .player-name, .name-tag, .round-status, #turn-announce, .start-panel h2, .results-heading h2, .team-verdict, .team-score-head { font-family: 'Manrope', sans-serif !important; letter-spacing: .015em; }
  .topbar h1 { font-size: 1.34rem; font-weight: 800; }
  .topbar .eyebrow, .results-kicker { color: #7be1d4; }
  .brand-mark { border-radius: 15px; border-color: rgba(100,222,207,.32); color: #a4fff2; background: linear-gradient(145deg, rgba(100,222,207,.14), rgba(100,222,207,.025)); box-shadow: 0 8px 28px rgba(26,134,130,.12); }
  .player-box { border: 1px solid rgba(213,230,239,.09); border-bottom: 1px solid rgba(213,230,239,.1); border-radius: 18px; background: linear-gradient(145deg, rgba(26,39,55,.96), rgba(17,27,41,.96)); }
  .player-box.active { border-color: color-mix(in srgb, var(--player-color), transparent 45%); box-shadow: 0 10px 28px rgba(0,0,0,.24), 0 0 22px color-mix(in srgb, var(--player-color), transparent 91%); }
  .player-name { font-size: .82rem; font-weight: 800; }
  .budget-val { font-size: 2.05rem; }
  .budget-label { text-transform: uppercase; font-size: .58rem; font-weight: 700; letter-spacing: .11em; }
  .team-progress { grid-column: 1; grid-row: 3; align-self: end; display: flex; align-items: center; gap: 8px; color: #8da2ad; font-size: .58rem; font-weight: 800; letter-spacing: .11em; }
  .team-progress strong { padding: 2px 8px; border: 1px solid rgba(100,222,207,.23); border-radius: 999px; color: #adfff4; background: rgba(100,222,207,.08); font-size: .65rem; font-variant-numeric: tabular-nums; }
  #auction-stage { border: 1px solid rgba(194,215,228,.08); background: rgba(16,25,37,.86); box-shadow: 0 28px 80px rgba(0,0,0,.28), inset 0 1px rgba(255,255,255,.035); }
  .commander-card-visual { border-color: rgba(100,222,207,.24); border-radius: 22px; background: radial-gradient(ellipse at 50% 30%, rgba(70,157,158,.15), transparent 47%), linear-gradient(155deg, #1c2b37, #121d29 68%, #14212b); box-shadow: inset 0 0 0 5px rgba(100,222,207,.018), 0 12px 30px rgba(0,0,0,.25); }
  .commander-card-visual::before { width: 250px; height: 290px; border-color: rgba(100,222,207,.1); border-radius: 28px; box-shadow: 0 0 0 10px rgba(100,222,207,.018), 0 0 0 22px rgba(100,222,207,.012); }
  .card-header { border-color: rgba(100,222,207,.18); }
  .name-tag { font-weight: 800; text-shadow: none; }
  .commander-portrait { border-color: rgba(100,222,207,.28); border-radius: 23px; box-shadow: 0 0 0 6px rgba(100,222,207,.035), 0 10px 28px rgba(0,0,0,.35); }
  .stat-item { width: 68px; height: 58px; border-radius: 15px; border-color: rgba(189,218,228,.13); background: rgba(7,14,22,.48); }
  .stat-item .lab { font-size: .55rem; }
  .card-caption { color: #75cfc4; letter-spacing: .17em; }
  .round-status { border-color: rgba(190,216,229,.09); color: #91a8b6; }
  .timer-display { width: 106px; height: 106px; border-radius: 27px; border-color: rgba(100,222,207,.34); background: linear-gradient(145deg, rgba(100,222,207,.08), rgba(7,13,21,.62)); box-shadow: 0 0 0 5px rgba(100,222,207,.025), 0 10px 26px rgba(0,0,0,.24); }
  .current-offer-box { border-color: rgba(100,222,207,.2); border-radius: 18px; background: linear-gradient(145deg, rgba(7,13,21,.62), rgba(21,32,44,.78)); }
  .offer-val { text-shadow: none; }
  .btn { border-radius: 13px; }
  .btn-bid { background: linear-gradient(145deg, #91efd0, #58c8ad); box-shadow: 0 5px 14px rgba(0,0,0,.2); }
  .btn-pass { background: #273748; }
  .btn:disabled { opacity: .42; filter: grayscale(.4); cursor: not-allowed; transform: none; }
  .screen-overlay { border-color: rgba(160,198,215,.12); background: rgba(8,14,22,.95); }
  .start-panel { border-color: rgba(100,222,207,.24); border-radius: 24px; background: radial-gradient(ellipse at 50% 0%, rgba(100,222,207,.12), transparent 60%), linear-gradient(145deg, #19283a, #101a28); box-shadow: 0 26px 80px rgba(0,0,0,.42); }
  .start-sigil { border-color: rgba(100,222,207,.35); color: #a5fff3; background: rgba(100,222,207,.08); box-shadow: 0 0 0 7px rgba(100,222,207,.025), 0 0 28px rgba(100,222,207,.1); }
  .team-verdict { border-color: rgba(100,222,207,.24); color: #b8fff5; background: rgba(100,222,207,.06); }
  .team-score.winner { border-color: rgba(100,222,207,.45); background: rgba(100,222,207,.09); }
  .results-table th { background: #172538; }
  #comm-era { letter-spacing: .06em; font-size: .58rem; }
  @media (max-width: 760px) { .team-progress { font-size: .52rem; } .player-box { grid-template-rows: auto auto auto; } }
  @media (max-width: 520px) { .team-progress { align-self: flex-start; } }
</style>
</head>
<body>

    <div id="game-ui">
        <div id="start-screen" class="screen-overlay" role="dialog" aria-modal="true" aria-labelledby="start-title">
            <div class="start-panel">
                <div class="start-sigil" aria-hidden="true">✦</div>
                <div class="eyebrow">STRATEJİ · TARİH · REKABET</div>
                <h2 id="start-title">Komutanlar Meclisi</h2>
                <p>Her elde 10 komutan için yarışın; her oyuncu takımına tam 5 komutan alır. El sonunda puan tablosu takım gücünü karşılaştırır.<br><small>Puanlar tarihsel değerlendirme değil, oyun dengesi içindir.</small></p>
                <button id="start-game-button" class="btn btn-bid" onclick="startGame()">OYUNU BAŞLAT</button>
            </div>
        </div>
        <header class="topbar"><div class="brand-mark" aria-hidden="true">✦</div><div class="topbar-copy"><div class="eyebrow">TARİHİN İZİNDE · STRATEJİ VE İRADE</div><h1>Komutanlar Meclisi</h1></div><div class="topbar-note"><span class="live-dot"></span> AÇIK ARTIRMA</div></header>
        
        <!-- ÜST OYUNCU BİLGİSİ -->
        <div class="player-header">
            <div id="box-1" class="player-box p1 active">
                <div class="player-name">OYUNCU 1</div>
                <div class="budget-val"><span id="p1-cash">20</span><span style="color:var(--gold)">AKÇE</span></div>
                <div class="budget-label">MEVCUT BÜTÇE</div><div class="team-progress">TAKIM <strong id="p1-team-count">0/5</strong></div>
            </div>
            <div id="box-2" class="player-box p2">
                <div class="player-name">OYUNCU 2</div>
                <div class="budget-val"><span id="p2-cash">20</span><span style="color:var(--gold)">AKÇE</span></div>
                <div class="budget-label">MEVCUT BÜTÇE</div><div class="team-progress">TAKIM <strong id="p2-team-count">0/5</strong></div>
            </div>
        </div>

        <!-- MÜZAYEDE SAHNESİ -->
        <div id="auction-stage">
            <!-- Sol Kart Görünümü -->
            <div class="commander-card-visual" id="commander-card">
                <div id="stamp">SATILDI</div>
                
                <div class="card-header">
                    <div class="era-tag" id="comm-era">---</div>
                    <h2 class="name-tag" id="comm-name">---</h2>
                </div>

                <div id="commander-portrait" class="commander-portrait" role="img" aria-label="Komutan portresi"></div>

                <div class="stat-circle-row">
                    <div class="stat-item"><span class="val" id="comm-atk">0</span><span class="lab">ATK</span></div>
                    <div class="stat-item"><span class="val" id="comm-int">0</span><span class="lab">INT</span></div>
                    <div class="stat-item"><span class="val" id="comm-ldr">0</span><span class="lab">LDR</span></div>
                </div>
                <div class="card-caption">KOMUTAN KARTI</div>
            </div>

            <!-- Sağ Teklif Paneli -->
            <div class="bid-info-panel">
                <div class="round-status">EL <span id="round-count">1</span> / 10 <span aria-hidden="true">·</span> LOT <span id="comm-count">1</span></div>
                
                <div id="timer-box" class="timer-display">10</div>

                <div class="current-offer-box">
                    <div class="era-tag">EN YÜKSEK TEKLİF</div>
                    <div class="offer-val"><span id="current-bid">0</span> AKÇE</div>
                    <div id="bidder-status" class="era-tag">İLK TEKLİF BEKLENİYOR</div>
                </div>

                <div id="turn-announce" style="font-family: 'Cinzel'; margin-top: 10px; color: var(--gold);">
                    SIRADAKİ: OYUNCU 1
                </div>

                <div class="action-area" id="controls">
                    <button class="btn btn-bid" onclick="placeBid(1)">+1 AKÇE</button>
                    <button class="btn btn-bid" onclick="placeBid(2)">+2 AKÇE</button>
                    <button class="btn btn-bid" onclick="placeBid(5)">+5 AKÇE</button>
                    <button class="btn btn-pass" onclick="handlePass()">PAS</button>
                </div>
            </div>
        </div>

        <!-- BÖLÜM SONU EKRANI -->
        <div id="final-screen" class="screen-overlay hidden" role="dialog" aria-modal="true" aria-labelledby="results-title">
            <div class="results-panel">
                <div class="results-heading">
                    <div class="results-kicker">MÜZAYEDE SONUCU</div>
                    <h2 id="results-title">EL TAMAMLANDI</h2>
                    <p id="round-summary">10 komutanlık el sona erdi.</p>
                </div>
                <div id="team-verdict" class="team-verdict" aria-live="polite">Takım gücü hesaplanıyor…</div>
                <div class="team-score-grid">
                    <div id="p1-team-card" class="team-score p1">
                        <div class="team-score-head"><span>OYUNCU 1</span><small id="p1-team-badge"></small></div>
                        <strong id="p1-team-score" class="team-score-val">0</strong>
                        <span id="p1-team-meta" class="team-score-meta">0 komutan · 0 akçe harcandı</span>
                    </div>
                    <div id="p2-team-card" class="team-score p2">
                        <div class="team-score-head"><span>OYUNCU 2</span><small id="p2-team-badge"></small></div>
                        <strong id="p2-team-score" class="team-score-val">0</strong>
                        <span id="p2-team-meta" class="team-score-meta">0 komutan · 0 akçe harcandı</span>
                    </div>
                </div>
                <div class="results-table-wrap">
                    <table class="results-table">
                        <thead><tr><th>LOT</th><th>KOMUTAN</th><th>SAHİBİ</th><th>TEKLİF</th><th>ATK</th><th>INT</th><th>LDR</th><th>GÜÇ</th></tr></thead>
                        <tbody id="round-results-body"></tbody>
                    </table>
                </div>
                <button class="btn btn-bid" onclick="nextRound()">YENİ ELE GEÇ</button>
            </div>
        </div>
    </div>

<script>
    // Kullanıcının verdiği 200 kişilik komutan listesi. Puanlar yalnızca oyun dengesi içindir.
    const commanderNames = [];
    function addCommanderGroup(era, names) {
        names.trim().split(/\r?\n/).forEach(name => commanderNames.push({ name: name.trim(), era }));
    }

    addCommanderGroup("Asr-ı Saadet ve Hulefa-i Raşidin", `
Hz. Muhammed (s.a.v.)
Hz. Ebu Bekir
Hz. Ömer
Hz. Osman
Hz. Ali
Hz. Hamza bin Abdülmuttalib
Halid bin Velid
Ebu Ubeyde bin Cerrah
Sa'd bin Ebu Vakkas
Amr bin As
Zeyd bin Harise
Cafer bin Ebu Talib
Abdullah bin Revaha
Usame bin Zeyd
Zübeyr bin Avvam
Talha bin Ubeydullah
Mikdad bin Amr
Ammar bin Yasir
Ubeyde bin Haris
Muaz bin Cebel
Ebu Eyyub el-Ensari
Ukbe bin Amir
Ka'b bin Malik
Seleme bin Ekva
Bera bin Azib
Ebu Musa el-Eş'ari
Cerir bin Abdullah
Şürahbil bin Hasene
Yezid bin Ebu Süfyan
Numan bin Mukarrin`);

    addCommanderGroup("Emeviler ve Abbasiler", `
Tarık bin Ziyad
Musa bin Nusayr
Ukbe bin Nafi
Muhammed bin Kasım es-Sekafi
Kuteybe bin Müslim
Mesleme bin Abdülmelik
Abdurrahman el-Gafiki
Ebu Müslim Horasani
Halife Mansur
Harun Reşid
Mutasım Billah
Afşin (Haydar bin Kavus)
Boğa el-Kebir
Boğa es-Sağir
Aşnas
Abdullah bin Ali
Tahir bin Hüseyin
Hasan bin Kahtaba
Yezid bin Mühelleb
Ziyad bin Ebih
Haccac bin Yusuf
Asad bin Abdullah el-Kasri
Ebu'l-Abbas es-Saffah
Ali bin İsa bin Mahan
Abbas bin Velid`);

    addCommanderGroup("Karahanlı, Gazneli ve Selçuklu Dönemi", `
Gazneli Mahmud
Sebük Tegin
Satuk Buğra Han
Tuğrul Bey
Çağrı Bey
Sultan Alp Arslan
Sultan Melikşah
Sultan Sencer
Kutalmışoğlu Süleyman Şah
I. Kılıç Arslan
I. Mesud
II. Kılıç Arslan
I. Gıyaseddin Keyhüsrev
I. İzzeddin Keykavus
I. Alaeddin Keykubat
Emir Savtegin
Porsuk Bey
Gümüştekin Gazi (Danişmendli)
Emir Karatekin
Afşin Bey
Artuk Bey
Çaka Bey
Mengücek Gazi
Saltuk Bey
İl-Gazi
Belek Gazi
Atsız (Harezmşah)
İlarslan
Tekiş (Harezmşah)
Celaleddin Harezmşah`);

    addCommanderGroup("Eyyubiler, Memlükler, Timurlular ve Babürler", `
İmadeddin Zengi
Nureddin Mahmud Zengi
Selahaddin Eyyubi
I. Adil
Şirkuh
Muzaffereddin Gökböri
Sultan Baybars
Seyfeddin Kutuz
Kalavun
Eşref Halil
Taragay
Emir Timur (Timurlenk)
Şahruh
Uluğ Bey
Babür Şah
Ekber Şah
Evrengzib (Alemgir Şah)
Şir Şah Suri
Muhammed Guri
Alaeddin Halaci
Nadir Şah (Afşar)
Şah İsmail
Şah Abbas
Ahmed Şah Dürrani
Tipu Sultan`);

    addCommanderGroup("Osmanlı İmparatorluğu Dönemi", `
Osman Gazi
Orhan Gazi
I. Murad (Hüdavendigar)
Yıldırım Bayezid
Çelebi Mehmed
II. Murad
Fatih Sultan Mehmed
Yavuz Sultan Selim
Kanuni Sultan Süleyman
Hacı İlbey
Evrenos Bey
Lala Şahin Paşa
Çandarlı Kara Halil Hayreddin Paşa
Zağanos Paşa
Turahan Bey
Malkoçoğlu Bali Bey
Hadım Sinan Paşa
Bıyıklı Mehmed Paşa
Barbaros Hayreddin Paşa
Oruç Reis
Turgut Reis
Piri Reis
Kılıç Ali Paşa
Piyale Paşa
Seydi Ali Reis
Salih Reis
Sokullu Mehmed Paşa
Lala Mustafa Paşa
Koca Sinan Paşa
Özdemiroğlu Osman Paşa
Tiryaki Hasan Paşa
Kuyucu Murad Paşa
Hafız Ahmed Paşa
IV. Murad
Kemankeş Kara Mustafa Paşa
Köprülü Mehmed Paşa
Fazıl Ahmed Paşa
Merzifonlu Kara Mustafa Paşa
Mezamorta Hüseyin Paşa
Baltacı Mehmed Paşa
Topal Osman Paşa
Cezayirli Gazi Hasan Paşa
Alemdar Mustafa Paşa
Gazi Osman Paşa (Plevne)
Gazi Ahmed Muhtar Paşa`);

    addCommanderGroup("Yakın Çağ, I. Dünya Savaşı ve Direniş Önderleri", `
Şeyh Şamil (Kafkasya)
Hacı Murat (Kafkasya)
Emir Abdülkadir (Cezayir)
Ömer Muhtar (Libya)
İmam Mansur (Kafkasya)
Enver Paşa
Fahreddin Paşa (Medine Müdafii)
Halil Kut (Kut'ül Amare)
Cemal Paşa
Cevat Çobanlı
Hafız Hakkı Paşa
Vehip Paşa
Esat Paşa (Bülkat)
Çerkez Ethem
Yörük Ali Efe
Demirci Mehmet Efe
Şahin Bey (Gaziantep)
Süleyman Askeri Bey
Şefik Aker
Nuri Paşa (Killigil)`);

    addCommanderGroup("Türk Kurtuluş Savaşı ve Bölgesel Direnişçiler", `
Gazi Mustafa Kemal Atatürk
Kazım Karabekir
Fevzi Çakmak
İsmet İnönü
Ali Fuat Cebesoy
Refet Bele
Nureddin Paşa (Konyalı)
Fahrettin Altay
Yakup Şevki Subaşı
Cahar Dudayev (Çeçenistan)
Aslan Mashadov (Çeçenistan)
Ahmed Şah Mesud (Afganistan)`);

    addCommanderGroup("Hamas ve İzzettin el-Kassam Tugayları Komutanları", `
Muhammed Deyf
Yahya Sinvar
Salah Şehade
Ahmed Cabari
Yahya Ayyaş
Marvan İsa
Salih el-Aruri
Mahmud el-Mebhuh
İmad Akil
Ayman Nofal
Rafi Salama
Muhammed Sinvar
Raed Saad`);

    const commanderPool = [];
    const seenCommanderNames = new Set();
    commanderNames.forEach((item, index) => {
        const normalizedName = item.name.normalize('NFKC').toLocaleLowerCase('tr-TR');
        if(seenCommanderNames.has(normalizedName)) return;
        seenCommanderNames.add(normalizedName);
        const seed = [...item.name].reduce((sum, char) => (sum * 31 + char.charCodeAt(0)) >>> 0, index + 7);
        commanderPool.push({
            name: item.name,
            era: item.era,
            atk: 72 + (seed % 28),
            int: 72 + (Math.floor(seed / 31) % 28),
            ldr: 72 + (Math.floor(seed / 961) % 28)
        });
    });
    // Oyun State
    let usedIds = [];
    let players = [ { cash: 20 }, { cash: 20 } ];
    let current10 = [];
    let commIndex = 0;
    let roundNum = 1;
    
    let bidAmount = 0;
    let lastBidder = -1; // 0: Player1, 1: Player2
    let currentTurn = 0; 
    let timer = 10;
    let interval = null;
    let gameStarted = false;
    let finalizingSale = false;
    let roundResults = [];

    function getTeamCounts() {
        return [0, 1].map(owner => roundResults.filter(item => item.owner === owner).length);
    }
    function startNewRoundPool() {
        current10 = [];
        let available = commanderPool.filter((_, idx) => !usedIds.includes(idx));
        if(available.length < 10) {
            alert("Bu listedeki komutanlar kullanıldı. Havuz yeniden karıştırılıyor.");
            usedIds = [];
            available = [...commanderPool];
        }
        
        // Rastgele 10 seç
        available.sort(() => 0.5 - Math.random());
        for(let i=0; i<10; i++) {
            current10.push(available[i]);
            // Gerçek indexi bul ve used'a ekle (basitlik için name kullanıyoruz)
            usedIds.push(commanderPool.indexOf(available[i]));
        }
    }

    function renderCommanderPortrait(commander) {
        if (commander.name.startsWith('Hz. Muhammed')) {
            return `<svg viewBox="0 0 220 230" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><defs><radialGradient id="symbolicBg"><stop stop-color="#705a37"/><stop offset="1" stop-color="#17262d"/></radialGradient></defs><rect width="220" height="230" fill="url(#symbolicBg)"/><circle cx="110" cy="112" r="69" fill="none" stroke="#64decf" stroke-width="2" opacity=".8"/><circle cx="110" cy="112" r="57" fill="none" stroke="#64decf" stroke-width="1" opacity=".45"/><path d="M110 47 L122 91 L165 69 L137 107 L178 119 L134 128 L157 168 L119 141 L108 184 L98 141 L58 163 L82 126 L39 114 L83 103 L61 62 L99 86Z" fill="#64decf" opacity=".82"/><circle cx="110" cy="112" r="18" fill="#fff0c7"/><circle cx="110" cy="112" r="8" fill="#64decf"/><path d="M36 207 H184" stroke="#64decf" opacity=".35"/></svg>`;
        }
        const seed = [...commander.name].reduce((sum, char) => (sum * 31 + char.charCodeAt(0)) >>> 0, 7);
        const choose = (values, offset = 0) => values[(seed + offset) % values.length];
        const skin = choose(['#c98c68', '#d6a078', '#b8795d', '#e0ad83', '#a96f55']);
        const robe = choose(['#315458', '#4d3d35', '#34445c', '#66513b', '#344a42'], 3);
        const trim = choose(['#d9b66f', '#c88b62', '#8bb6a7'], 6);
        const hair = choose(['#211c1a', '#34251e', '#4a382b', '#252b2b'], 9);
        const headgear = commander.era.includes('Hamas') ? 'keffiyeh' : (commander.era.includes('Kurtuluş') ? 'cap' : (commander.era.includes('Yakın Çağ') ? 'fez' : 'turban'));
        const faceRx = 38 + (seed % 7);
        const beard = seed % 4;
        let headwear = '';
        if (headgear === 'cap') {
            headwear = `<path d="M69 68 Q72 31 110 28 Q147 30 151 67 L144 78 L76 78Z" fill="#3b5148" stroke="#69ded1" stroke-width="2.5"/><path d="M67 66 Q110 57 153 66 L147 78 Q109 73 73 82Z" fill="#526b5d"/><circle cx="110" cy="42" r="5" fill="#69ded1"/>`;
        } else if (headgear === 'keffiyeh') {
            headwear = `<path d="M60 83 Q54 49 80 34 Q105 18 136 34 Q164 50 157 84 L145 79 Q145 58 130 53 Q110 61 84 51 Q74 62 74 81Z" fill="#e4dfd0" stroke="#69ded1" stroke-width="2.5"/><path d="M69 43 L147 72 M63 56 L137 82 M79 30 L154 58 M76 79 L137 45 M92 84 L153 61" stroke="#3c3430" stroke-width="3" opacity=".68"/><path d="M74 48 Q107 67 146 46" fill="none" stroke="#302a28" stroke-width="4"/>`;
        } else if (headgear === 'helmet') {
            headwear = `<path d="M64 91 Q57 48 82 31 Q109 9 138 32 Q162 51 155 91 L142 80 L139 57 Q111 39 81 59 L77 84Z" fill="${choose(['#596c6c','#776449','#485c66'], 12)}" stroke="#69ded1" stroke-width="3"/><path d="M109 22 L109 10 M102 25 L94 14 M116 25 L124 14" stroke="#69ded1" stroke-width="3" stroke-linecap="round"/>`;
        } else if (headgear === 'fez') {
            headwear = `<path d="M75 59 Q78 28 107 25 Q136 28 140 59 L136 76 L79 76Z" fill="#8c4034" stroke="#69ded1" stroke-width="2.5"/><path d="M75 58 Q108 52 140 58 L139 68 Q107 74 77 68Z" fill="#b36345"/><path d="M126 27 Q137 15 144 20 L133 36" fill="none" stroke="#69ded1" stroke-width="3" stroke-linecap="round"/>`;
        } else {
            headwear = `<path d="M61 82 Q54 48 79 36 Q75 18 102 18 Q131 13 145 37 Q167 52 154 83 L143 77 Q143 58 130 53 Q111 63 84 51 Q75 61 75 80Z" fill="${choose(['#d7c39a','#6c877d','#b48c58','#526c7a'], 14)}" stroke="#69ded1" stroke-width="2.5"/><path d="M74 44 Q106 62 145 42 M69 56 Q106 75 153 53 M78 31 Q111 47 139 31" fill="none" stroke="rgba(255,241,205,.45)" stroke-width="3"/>`;
        }
        let beardShape = '';
        if (beard === 0) beardShape = `<path d="M76 137 Q108 151 144 136 Q137 176 110 190 Q84 177 76 137Z" fill="${hair}"/>`;
        else if (beard === 1) beardShape = `<path d="M74 132 Q110 146 146 132 Q138 165 127 171 Q110 163 94 174 Q79 165 74 132Z" fill="${hair}"/>`;
        else if (beard === 2) beardShape = `<path d="M79 139 Q109 151 140 138 Q131 162 111 166 Q89 163 79 139Z" fill="${hair}"/>`;
        const beardLine = beard === 3 ? '' : `<path d="M87 145 Q109 154 132 145" fill="none" stroke="${hair}" stroke-width="9" stroke-linecap="round"/>`;
        return `<svg viewBox="0 0 220 230" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <defs><linearGradient id="portraitBg" x1="0" y1="0" x2="1" y2="1"><stop stop-color="${choose(['#42606a','#66553d','#3e5361'], 17)}"/><stop offset="1" stop-color="#17262d"/></linearGradient><linearGradient id="robe" x1="0" y1="0" x2="0" y2="1"><stop stop-color="${robe}"/><stop offset="1" stop-color="#17242a"/></linearGradient></defs>
          <rect width="220" height="230" fill="url(#portraitBg)"/><circle cx="28" cy="33" r="1.7" fill="#64decf" opacity=".55"/><circle cx="188" cy="55" r="1.4" fill="#64decf" opacity=".45"/><path d="M14 206V94 Q14 21 110 15 Q206 22 206 94V206" fill="none" stroke="#64decf" opacity=".16" stroke-width="2"/>
          <path d="M30 230 Q40 178 78 166 L110 180 L143 166 Q183 180 192 230Z" fill="url(#robe)"/><path d="M81 170 L109 203 L139 169 L155 230 L65 230Z" fill="${trim}"/><path d="M96 185 L109 200 L123 185 L132 230 L87 230Z" fill="#203238"/><path d="M93 151 L91 176 Q110 190 130 175 L126 150Z" fill="${skin}"/>
          <ellipse cx="${110-faceRx-1}" cy="111" rx="8" ry="13" fill="${skin}"/><ellipse cx="${110+faceRx+1}" cy="111" rx="8" ry="13" fill="${skin}"/><ellipse cx="110" cy="108" rx="${faceRx}" ry="56" fill="${skin}"/>
          ${headwear}
          <path d="M83 102 Q94 94 103 101" fill="none" stroke="${hair}" stroke-width="4" stroke-linecap="round"/><path d="M117 101 Q128 94 138 101" fill="none" stroke="${hair}" stroke-width="4" stroke-linecap="round"/><ellipse cx="95" cy="109" rx="4" ry="3" fill="#241e1a"/><ellipse cx="126" cy="109" rx="4" ry="3" fill="#241e1a"/><path d="M110 108 L105 129 Q110 133 116 129" fill="none" stroke="#8a5d48" stroke-width="3" stroke-linecap="round"/><path d="M100 141 Q110 146 121 140" fill="none" stroke="#6d4136" stroke-width="3" stroke-linecap="round"/>
          ${beardShape}${beardLine}<path d="M86 129 Q94 134 101 130 M119 130 Q128 134 135 128" fill="none" stroke="${hair}" stroke-width="5" stroke-linecap="round"/>
          <path d="M72 178 L109 211 L148 177" fill="none" stroke="${trim}" stroke-width="2" opacity=".8"/><circle cx="109" cy="207" r="4" fill="#64decf"/>
        </svg>`;
    }
    function initComm() {
        if(commIndex >= 10) { showRoundSummary(); return; }
        const commander = current10[commIndex];
        document.getElementById('comm-name').innerText = commander.name;
        document.getElementById('comm-era').innerText = commander.era;
        document.getElementById('comm-atk').innerText = commander.atk;
        document.getElementById('comm-int').innerText = commander.int;
        document.getElementById('comm-ldr').innerText = commander.ldr;
        const portrait = document.getElementById('commander-portrait');
        portrait.innerHTML = renderCommanderPortrait(commander);
        portrait.setAttribute('aria-label', commander.name + ' için dönem temalı komutan portresi');
        document.getElementById('comm-count').innerText = commIndex + 1;
        document.getElementById('round-count').innerText = roundNum;
        bidAmount = 0; lastBidder = -1; timer = 10;
        const counts = getTeamCounts();
        if(counts[0] >= 5 || counts[1] >= 5) {
            const owner = counts[0] >= 5 ? 1 : 0;
            currentTurn = owner; updateUI();
            document.getElementById('turn-announce').innerText = `OYUNCU ${owner + 1} TAKIMI 5/5'E TAMAMLANIYOR`;
            document.getElementById('controls').classList.add('hidden');
            clearInterval(interval);
            setTimeout(() => settleSale(owner, 0, `OYUNCU ${owner + 1} TAKIMINA EKLENDİ`), 850);
            return;
        }
        currentTurn = 0; updateUI(); startTimer();
    }
    function startTimer() {
        clearInterval(interval);
        timer = 10;
        document.getElementById('timer-box').innerText = timer;
        interval = setInterval(() => {
            timer--;
            document.getElementById('timer-box').innerText = timer;
            if(timer <= 0) {
                clearInterval(interval);
                finalizeSale();
            }
        }, 1000);
    }

    function placeBid(inc) {
        let bidder = currentTurn;
        if(finalizingSale || getTeamCounts()[bidder] >= 5) return;
        let price = bidAmount + inc;

        if(players[bidder].cash >= price) {
            bidAmount = price;
            lastBidder = bidder;
            timer = 10; // Reset timer on bid
            document.getElementById('timer-box').innerText = timer;
            
            currentTurn = currentTurn === 0 ? 1 : 0;
            updateUI();
        } else {
            alert("Yetersiz Akçe!");
        }
    }

    function handlePass() {
        finalizeSale();
    }

    function finalizeSale() {
        if(finalizingSale || !gameStarted) return;
        if(lastBidder !== -1) {
            settleSale(lastBidder, bidAmount, `SATILDI: OYUNCU ${lastBidder + 1}`);
            return;
        }
        const counts = getTeamCounts();
        let owner;
        if(counts[0] < counts[1]) owner = 0;
        else if(counts[1] < counts[0]) owner = 1;
        else owner = (roundNum + commIndex) % 2;
        settleSale(owner, 0, `OTOMATİK SEÇİM: OYUNCU ${owner + 1}`);
    }

    function settleSale(owner, price, stampText) {
        if(finalizingSale || !gameStarted) return;
        finalizingSale = true;
        clearInterval(interval);
        const stamp = document.getElementById('stamp');
        const commander = current10[commIndex];
        if(price > 0) players[owner].cash -= price;
        stamp.innerText = stampText;
        stamp.classList.add('show-stamp');
        roundResults.push({ commander, owner, price });
        updateUI();
        document.getElementById('controls').classList.add('hidden');
        setTimeout(() => {
            stamp.classList.remove('show-stamp');
            document.getElementById('controls').classList.remove('hidden');
            finalizingSale = false;
            commIndex++;
            initComm();
        }, 1100);
    }

    function updateUI() {
        document.getElementById('p1-cash').innerText = players[0].cash;
        document.getElementById('p2-cash').innerText = players[1].cash;
        document.getElementById('current-bid').innerText = bidAmount;
        document.getElementById('bidder-status').innerText = lastBidder === -1 ? 'İLK TEKLİF BEKLENİYOR' : 'Son Teklif: Oyuncu ' + (lastBidder + 1);
        document.getElementById('turn-announce').innerText = 'SIRADAKİ: OYUNCU ' + (currentTurn + 1);
        const counts = getTeamCounts();
        document.getElementById('p1-team-count').innerText = `${counts[0]}/5`;
        document.getElementById('p2-team-count').innerText = `${counts[1]}/5`;
        document.getElementById('box-1').classList.toggle('active', currentTurn === 0 && counts[0] < 5);
        document.getElementById('box-2').classList.toggle('active', currentTurn === 1 && counts[1] < 5);
        const increments = [1, 2, 5];
        document.querySelectorAll('#controls .btn-bid').forEach((button, index) => {
            button.disabled = !gameStarted || finalizingSale || counts[currentTurn] >= 5 || players[currentTurn].cash < bidAmount + increments[index];
        });
        document.querySelector('#controls .btn-pass').disabled = finalizingSale || counts[currentTurn] >= 5;
    }
    function showRoundSummary() {
        clearInterval(interval);
        const totals = [0, 1].map(owner => {
            const won = roundResults.filter(item => item.owner === owner);
            return {
                count: won.length,
                spent: won.reduce((sum, item) => sum + item.price, 0),
                score: won.reduce((sum, item) => sum + item.commander.atk + item.commander.int + item.commander.ldr, 0)
            };
        });
        document.getElementById('round-summary').innerText = `${roundResults.length} komutanlık el sona erdi. Güç puanı, takımınızdaki komutanların ATK + INT + LDR değerlerinin toplamıdır.`;
        document.getElementById('p1-team-score').innerText = totals[0].score;
        document.getElementById('p2-team-score').innerText = totals[1].score;
        document.getElementById('p1-team-meta').innerText = `${totals[0].count} komutan · ${totals[0].spent} akçe harcandı`;
        document.getElementById('p2-team-meta').innerText = `${totals[1].count} komutan · ${totals[1].spent} akçe harcandı`;
        const verdict = document.getElementById('team-verdict');
        const badges = [document.getElementById('p1-team-badge'), document.getElementById('p2-team-badge')];
        const cards = [document.getElementById('p1-team-card'), document.getElementById('p2-team-card')];
        badges.forEach(item => item.innerText = '');
        cards.forEach(item => item.classList.remove('winner'));
        if(totals[0].score > totals[1].score) {
            verdict.innerText = `OYUNCU 1 DAHA GÜÇLÜ TAKIM KURDU · ${totals[0].score - totals[1].score} PUAN FARK`;
            badges[0].innerText = 'GÜÇLÜ TAKIM'; cards[0].classList.add('winner');
        } else if(totals[1].score > totals[0].score) {
            verdict.innerText = `OYUNCU 2 DAHA GÜÇLÜ TAKIM KURDU · ${totals[1].score - totals[0].score} PUAN FARK`;
            badges[1].innerText = 'GÜÇLÜ TAKIM'; cards[1].classList.add('winner');
        } else {
            verdict.innerText = totals[0].score === 0 ? 'BU ELDE KOMUTAN SATIN ALINMADI.' : 'TAKIM GÜÇLERİ EŞİT · EL BERABERE';
        }
        const tbody = document.getElementById('round-results-body');
        tbody.innerHTML = '';
        roundResults.forEach((item, index) => {
            const commander = item.commander;
            const power = commander.atk + commander.int + commander.ldr;
            const ownerName = item.owner === -1 ? 'Satılmadı' : `Oyuncu ${item.owner + 1}`;
            const row = document.createElement('tr');
            row.className = item.owner === -1 ? 'unowned' : `p${item.owner + 1}-row`;
            [String(index + 1).padStart(2, '0'), commander.name, ownerName, item.price ? `${item.price} akçe` : '—', commander.atk, commander.int, commander.ldr, power].forEach(value => {
                const cell = document.createElement('td');
                cell.textContent = value;
                row.appendChild(cell);
            });
            tbody.appendChild(row);
        });
        document.getElementById('final-screen').classList.remove('hidden');
    }

    function startGame() {
        if(gameStarted) return;
        gameStarted = true;
        document.getElementById('start-screen').classList.add('hidden');
        startNewRoundPool();
        initComm();
    }
    function nextRound() {
        roundNum++;
        commIndex = 0;
        roundResults = [];
        document.getElementById('final-screen').classList.add('hidden');
        startNewRoundPool();
        initComm();
    }
    // Başlangıç ekranı görünür; açık artırma yalnızca kullanıcı başlattığında kurulur.
</script>
</body>
</html>
















