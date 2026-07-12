<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERROR IN FOREX - By Rehman Arshad</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --neon-green: #00ff88;
            --neon-green-dim: #00cc6a;
            --dark-bg: #0a0f0a;
            --card-bg: rgba(10, 20, 10, 0.85);
            --border-glow: 0 0 20px rgba(0, 255, 136, 0.3);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Rajdhani', sans-serif;
            background: var(--dark-bg);
            color: #e0ffe0;
            min-height: 100vh;
            overflow-x: hidden;
            cursor: none;
        }

        /* ===== CUSTOM CURSOR CIRCLE ===== */
        .cursor-circle {
            position: fixed;
            top: 0;
            left: 0;
            width: 40px;
            height: 40px;
            border: 2px solid var(--neon-green);
            border-radius: 50%;
            pointer-events: none;
            z-index: 99999;
            transform: translate(-50%, -50%);
            transition: width 0.15s ease, height 0.15s ease, border-color 0.15s ease;
            mix-blend-mode: screen;
        }
        .cursor-circle::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 8px;
            height: 8px;
            background: var(--neon-green);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 0 10px var(--neon-green), 0 0 20px var(--neon-green);
            transition: all 0.15s ease;
        }
        .cursor-circle.hovering {
            width: 60px;
            height: 60px;
            border-color: rgba(0, 255, 136, 0.6);
        }
        .cursor-circle.hovering::before {
            width: 12px;
            height: 12px;
            box-shadow: 0 0 15px var(--neon-green), 0 0 30px var(--neon-green), 0 0 50px var(--neon-green);
        }
        .cursor-circle .cursor-fill {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: radial-gradient(circle, rgba(0, 255, 136, 0.25) 0%, rgba(0, 255, 136, 0.1) 40%, transparent 70%);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: all 0.2s ease;
            filter: blur(4px);
            pointer-events: none;
        }
        .cursor-circle.hovering .cursor-fill {
            width: 100%;
            height: 100%;
        }

        /* Animated Green Lighting Background */
        .bg-lights {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            z-index: -1;
            background: 
                radial-gradient(ellipse at 20% 50%, rgba(0, 255, 136, 0.08) 0%, transparent 50%),
                radial-gradient(ellipse at 80% 20%, rgba(0, 255, 136, 0.06) 0%, transparent 50%),
                radial-gradient(ellipse at 50% 80%, rgba(0, 255, 136, 0.05) 0%, transparent 50%),
                linear-gradient(180deg, #0a0f0a 0%, #051005 50%, #0a0f0a 100%);
        }

        .light-beam {
            position: fixed;
            width: 3px;
            height: 100vh;
            background: linear-gradient(180deg, transparent, var(--neon-green), transparent);
            opacity: 0.15;
            animation: beamMove 8s ease-in-out infinite;
            z-index: -1;
        }
        .light-beam:nth-child(1) { left: 10%; animation-delay: 0s; }
        .light-beam:nth-child(2) { left: 30%; animation-delay: 2s; }
        .light-beam:nth-child(3) { left: 50%; animation-delay: 4s; }
        .light-beam:nth-child(4) { left: 70%; animation-delay: 1s; }
        .light-beam:nth-child(5) { left: 90%; animation-delay: 3s; }

        @keyframes beamMove {
            0%, 100% { transform: translateY(-100%) scaleY(0.5); opacity: 0.1; }
            50% { transform: translateY(0%) scaleY(1.2); opacity: 0.25; }
        }

        .particles {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            z-index: -1;
            pointer-events: none;
        }
        .particle {
            position: absolute;
            width: 4px; height: 4px;
            background: var(--neon-green);
            border-radius: 50%;
            opacity: 0.4;
            animation: floatParticle 15s infinite;
        }
        @keyframes floatParticle {
            0% { transform: translateY(100vh) scale(0); opacity: 0; }
            10% { opacity: 0.6; }
            90% { opacity: 0.6; }
            100% { transform: translateY(-10vh) scale(1); opacity: 0; }
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            position: relative;
            z-index: 1;
        }

        .header {
            text-align: center;
            padding: 40px 0 30px;
        }

        .glitch-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 2.8rem;
            font-weight: 900;
            color: var(--neon-green);
            text-shadow: 0 0 10px var(--neon-green), 0 0 20px var(--neon-green), 0 0 40px var(--neon-green-dim);
            animation: glitch 2s infinite, pulseGlow 3s ease-in-out infinite;
            letter-spacing: 3px;
            position: relative;
        }
        .glitch-title::before,
        .glitch-title::after {
            content: attr(data-text);
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
        }
        .glitch-title::before {
            color: #ff0040;
            animation: glitchTop 2s infinite;
            clip-path: polygon(0 0, 100% 0, 100% 35%, 0 35%);
        }
        .glitch-title::after {
            color: #00ffff;
            animation: glitchBottom 2s infinite;
            clip-path: polygon(0 65%, 100% 65%, 100% 100%, 0 100%);
        }

        @keyframes glitch {
            0%, 90%, 100% { transform: translate(0); }
            92% { transform: translate(-3px, 2px); }
            94% { transform: translate(3px, -2px); }
            96% { transform: translate(-2px, 1px); }
            98% { transform: translate(2px, -1px); }
        }
        @keyframes glitchTop {
            0%, 90%, 100% { transform: translate(0); opacity: 0.8; }
            92% { transform: translate(4px, -2px); }
            94% { transform: translate(-4px, 2px); }
            96% { transform: translate(2px, -1px); }
        }
        @keyframes glitchBottom {
            0%, 90%, 100% { transform: translate(0); opacity: 0.8; }
            92% { transform: translate(-4px, 2px); }
            94% { transform: translate(4px, -2px); }
            96% { transform: translate(-2px, 1px); }
        }
        @keyframes pulseGlow {
            0%, 100% { text-shadow: 0 0 10px var(--neon-green), 0 0 20px var(--neon-green), 0 0 40px var(--neon-green-dim); }
            50% { text-shadow: 0 0 20px var(--neon-green), 0 0 40px var(--neon-green), 0 0 80px var(--neon-green-dim); }
        }

        .subtitle {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.4rem;
            color: #aaffaa;
            margin-top: 10px;
            letter-spacing: 5px;
            animation: shake 4s ease-in-out infinite;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            2% { transform: translateX(-3px); }
            4% { transform: translateX(3px); }
            6% { transform: translateX(-2px); }
            8% { transform: translateX(2px); }
            10% { transform: translateX(0); }
        }

        .card {
            background: var(--card-bg);
            border: 1px solid rgba(0, 255, 136, 0.2);
            border-radius: 16px;
            padding: 28px;
            margin-bottom: 24px;
            backdrop-filter: blur(10px);
            box-shadow: var(--border-glow);
            animation: cardEntry 0.8s ease-out;
            transition: all 0.3s ease;
        }
        .card:hover {
            border-color: rgba(0, 255, 136, 0.5);
            box-shadow: 0 0 30px rgba(0, 255, 136, 0.2);
            transform: translateY(-3px);
        }
        @keyframes cardEntry {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.3rem;
            color: var(--neon-green);
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .card-title .icon { font-size: 1.5rem; }
        .card-text {
            font-size: 1.05rem;
            line-height: 1.8;
            color: #c8e6c9;
        }

        .payment-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
            margin-top: 16px;
        }
        .payment-card {
            background: rgba(0, 40, 20, 0.6);
            border: 1px solid rgba(0, 255, 136, 0.15);
            border-radius: 12px;
            padding: 18px;
            text-align: center;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .payment-card::before {
            content: '';
            position: absolute;
            top: 0; left: -100%; width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(0, 255, 136, 0.1), transparent);
            transition: left 0.5s;
        }
        .payment-card:hover::before { left: 100%; }
        .payment-card:hover {
            border-color: var(--neon-green);
            transform: scale(1.03);
        }
        .payment-name {
            font-family: 'Orbitron', sans-serif;
            font-size: 0.95rem;
            color: var(--neon-green);
            margin-bottom: 8px;
        }
        .payment-detail {
            font-size: 0.9rem;
            color: #aaffaa;
            word-break: break-all;
            margin-bottom: 4px;
        }
        .payment-detail.label {
            font-size: 0.8rem;
            color: #88cc88;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .copy-btn {
            margin-top: 10px;
            background: transparent;
            border: 1px solid var(--neon-green);
            color: var(--neon-green);
            padding: 6px 16px;
            border-radius: 20px;
            cursor: pointer;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .copy-btn:hover {
            background: var(--neon-green);
            color: #000;
            box-shadow: 0 0 15px var(--neon-green);
        }
        .copy-btn.copied {
            background: var(--neon-green);
            color: #000;
        }

        .form-group { margin-bottom: 20px; }
        .form-label {
            display: block;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.9rem;
            color: var(--neon-green);
            margin-bottom: 8px;
            letter-spacing: 1px;
        }
        .form-input {
            width: 100%;
            padding: 14px 18px;
            background: rgba(0, 30, 15, 0.6);
            border: 1px solid rgba(0, 255, 136, 0.2);
            border-radius: 10px;
            color: #e0ffe0;
            font-family: 'Rajdhani', sans-serif;
            font-size: 1rem;
            transition: all 0.3s;
            outline: none;
        }
        .form-input:focus {
            border-color: var(--neon-green);
            box-shadow: 0 0 15px rgba(0, 255, 136, 0.2);
        }
        .form-input::placeholder { color: #558855; }

        .file-upload {
            position: relative;
            border: 2px dashed rgba(0, 255, 136, 0.3);
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            background: rgba(0, 30, 15, 0.4);
        }
        .file-upload:hover {
            border-color: var(--neon-green);
            background: rgba(0, 255, 136, 0.05);
        }
        .file-upload input { display: none; }
        .file-upload-icon { font-size: 2.5rem; margin-bottom: 10px; }
        .file-upload-text { color: #88cc88; font-size: 1rem; }
        .file-preview {
            margin-top: 12px;
            max-width: 200px;
            border-radius: 8px;
            border: 1px solid var(--neon-green);
            display: none;
        }

        .price-section {
            text-align: center;
            padding: 30px;
        }
        .price-label {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.3rem;
            color: #fff;
            margin-bottom: 10px;
        }
        .price-amount {
            font-family: 'Orbitron', sans-serif;
            font-size: 2.2rem;
            color: var(--neon-green);
            text-shadow: 0 0 20px var(--neon-green);
            animation: pricePulse 2s ease-in-out infinite;
        }
        @keyframes pricePulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .register-btn {
            margin-top: 20px;
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, var(--neon-green), var(--neon-green-dim));
            border: none;
            border-radius: 12px;
            color: #000;
            font-family: 'Orbitron', sans-serif;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s;
            letter-spacing: 2px;
            position: relative;
            overflow: hidden;
        }
        .register-btn::before {
            content: '';
            position: absolute;
            top: 0; left: -100%; width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }
        .register-btn:hover::before { left: 100%; }
        .register-btn:hover {
            box-shadow: 0 0 30px var(--neon-green);
            transform: translateY(-2px);
        }
        .register-btn:disabled {
            background: #333;
            color: #666;
            cursor: not-allowed;
            box-shadow: none;
        }
        .register-btn:disabled::before { display: none; }

        .admin-lock {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 100;
        }
        .lock-btn {
            width: 60px; height: 60px;
            border-radius: 50%;
            background: rgba(0, 20, 10, 0.9);
            border: 2px solid var(--neon-green);
            color: var(--neon-green);
            font-size: 1.5rem;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 20px rgba(0, 255, 136, 0.2);
        }
        .lock-btn:hover {
            transform: scale(1.1);
            box-shadow: 0 0 30px var(--neon-green);
        }

        .modal-overlay {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.85);
            backdrop-filter: blur(8px);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            animation: fadeIn 0.3s;
        }
        .modal-overlay.active { display: flex; }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }

        .modal {
            background: var(--card-bg);
            border: 1px solid var(--neon-green);
            border-radius: 20px;
            padding: 40px;
            max-width: 420px;
            width: 90%;
            box-shadow: 0 0 50px rgba(0, 255, 136, 0.2);
            animation: modalSlide 0.4s ease-out;
            position: relative;
        }
        @keyframes modalSlide {
            from { transform: translateY(-50px) scale(0.9); opacity: 0; }
            to { transform: translateY(0) scale(1); opacity: 1; }
        }
        .modal-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.4rem;
            color: var(--neon-green);
            text-align: center;
            margin-bottom: 24px;
        }
        .password-input {
            width: 100%;
            padding: 14px 18px;
            background: rgba(0, 30, 15, 0.6);
            border: 1px solid rgba(0, 255, 136, 0.3);
            border-radius: 10px;
            color: #e0ffe0;
            font-family: 'Rajdhani', sans-serif;
            font-size: 1rem;
            text-align: center;
            letter-spacing: 3px;
            margin-bottom: 16px;
            outline: none;
        }
        .password-input:focus {
            border-color: var(--neon-green);
            box-shadow: 0 0 15px rgba(0, 255, 136, 0.2);
        }
        .modal-btn {
            width: 100%;
            padding: 14px;
            background: var(--neon-green);
            border: none;
            border-radius: 10px;
            color: #000;
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s;
        }
        .modal-btn:hover { box-shadow: 0 0 20px var(--neon-green); }
        .close-modal {
            position: absolute;
            top: 15px; right: 20px;
            background: none;
            border: none;
            color: #88cc88;
            font-size: 1.5rem;
            cursor: pointer;
        }

        /* Admin Panel */
        .admin-panel {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: var(--dark-bg);
            z-index: 2000;
            overflow-y: auto;
        }
        .admin-panel.active { display: block; }

        .admin-header {
            background: rgba(0, 30, 15, 0.9);
            padding: 20px 30px;
            border-bottom: 1px solid var(--neon-green);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        .admin-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.5rem;
            color: var(--neon-green);
        }
        .admin-close {
            background: transparent;
            border: 1px solid var(--neon-green);
            color: var(--neon-green);
            padding: 8px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 600;
            transition: all 0.3s;
        }
        .admin-close:hover {
            background: var(--neon-green);
            color: #000;
        }

        .admin-nav {
            display: flex;
            gap: 10px;
            padding: 20px 30px;
            border-bottom: 1px solid rgba(0, 255, 136, 0.1);
            flex-wrap: wrap;
        }
        .admin-tab {
            padding: 10px 24px;
            background: transparent;
            border: 1px solid rgba(0, 255, 136, 0.2);
            border-radius: 8px;
            color: #88cc88;
            cursor: pointer;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 600;
            transition: all 0.3s;
        }
        .admin-tab.active, .admin-tab:hover {
            background: var(--neon-green);
            color: #000;
            border-color: var(--neon-green);
        }

        .admin-content {
            padding: 30px;
        }

        .student-card {
            background: rgba(0, 30, 15, 0.6);
            border: 1px solid rgba(0, 255, 136, 0.15);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 16px;
            display: grid;
            grid-template-columns: 1fr auto auto;
            gap: 20px;
            align-items: center;
            animation: cardEntry 0.5s ease-out;
        }
        .student-info h4 {
            font-family: 'Orbitron', sans-serif;
            color: var(--neon-green);
            margin-bottom: 6px;
        }
        .student-info p {
            color: #88cc88;
            font-size: 0.9rem;
            margin: 2px 0;
        }
        .student-proof {
            max-width: 120px;
            max-height: 120px;
            border-radius: 8px;
            border: 1px solid var(--neon-green);
            cursor: zoom-in;
            transition: transform 0.3s;
            object-fit: cover;
        }
        .student-proof:hover { transform: scale(1.1); }

        .student-actions {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .approve-btn, .reject-btn, .delete-btn {
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-family: 'Rajdhani', sans-serif;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.3s;
        }
        .approve-btn {
            background: var(--neon-green);
            color: #000;
        }
        .approve-btn:hover { box-shadow: 0 0 15px var(--neon-green); }
        .reject-btn {
            background: transparent;
            border: 1px solid #ff4444;
            color: #ff4444;
        }
        .reject-btn:hover { background: #ff4444; color: #fff; }
        .delete-btn {
            background: transparent;
            border: 1px solid #ff4444;
            color: #ff4444;
        }
        .delete-btn:hover {
            background: #ff4444;
            color: #fff;
            box-shadow: 0 0 15px #ff4444;
        }

        .badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
        }
        .badge-pending { background: rgba(255, 193, 7, 0.2); color: #ffc107; border: 1px solid #ffc107; }
        .badge-approved { background: rgba(0, 255, 136, 0.2); color: var(--neon-green); border: 1px solid var(--neon-green); }
        .badge-rejected { background: rgba(255, 68, 68, 0.2); color: #ff4444; border: 1px solid #ff4444; }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #558855;
        }
        .empty-state-icon { font-size: 4rem; margin-bottom: 16px; }

        /* ===== DELETE CONFIRMATION MODAL ===== */
        .delete-modal-overlay {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.9);
            backdrop-filter: blur(10px);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 6000;
            animation: fadeIn 0.3s;
        }
        .delete-modal-overlay.active { display: flex; }

        .delete-modal {
            background: var(--card-bg);
            border: 2px solid #ff4444;
            border-radius: 20px;
            padding: 35px;
            max-width: 400px;
            width: 90%;
            text-align: center;
            box-shadow: 0 0 50px rgba(255, 68, 68, 0.3);
            animation: modalSlide 0.4s ease-out;
        }
        .delete-modal-icon {
            font-size: 3.5rem;
            margin-bottom: 15px;
        }
        .delete-modal-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.3rem;
            color: #ff4444;
            margin-bottom: 10px;
        }
        .delete-modal-text {
            color: #88cc88;
            font-size: 1rem;
            margin-bottom: 25px;
        }
        .delete-modal-student {
            color: var(--neon-green);
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 25px;
            padding: 10px;
            background: rgba(0, 255, 136, 0.1);
            border-radius: 8px;
            border: 1px solid rgba(0, 255, 136, 0.2);
        }
        .delete-modal-buttons {
            display: flex;
            gap: 12px;
            justify-content: center;
        }
        .delete-modal-btn {
            padding: 12px 28px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            font-size: 0.95rem;
            transition: all 0.3s;
        }
        .delete-confirm-btn {
            background: #ff4444;
            color: #fff;
        }
        .delete-confirm-btn:hover {
            box-shadow: 0 0 20px #ff4444;
            transform: scale(1.05);
        }
        .delete-cancel-btn {
            background: transparent;
            border: 1px solid #88cc88;
            color: #88cc88;
        }
        .delete-cancel-btn:hover {
            background: rgba(136, 204, 136, 0.2);
        }

        /* ===== IMAGE VIEWER MODAL ===== */
        .img-viewer-overlay {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.92);
            backdrop-filter: blur(10px);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 5000;
            animation: fadeIn 0.3s;
        }
        .img-viewer-overlay.active { display: flex; }

        .img-viewer-box {
            position: relative;
            max-width: 90vw;
            max-height: 90vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }
        .img-viewer-img {
            max-width: 85vw;
            max-height: 75vh;
            border-radius: 12px;
            border: 2px solid var(--neon-green);
            box-shadow: 0 0 40px rgba(0, 255, 136, 0.3);
            object-fit: contain;
        }
        .img-viewer-info {
            color: var(--neon-green);
            font-family: 'Orbitron', sans-serif;
            font-size: 1rem;
            text-align: center;
        }
        .img-viewer-close {
            position: absolute;
            top: -50px;
            right: 0;
            background: rgba(255, 68, 68, 0.9);
            border: none;
            color: #fff;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            font-size: 1.3rem;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .img-viewer-close:hover {
            transform: scale(1.1);
            box-shadow: 0 0 15px #ff4444;
        }
        .img-viewer-download {
            background: var(--neon-green);
            border: none;
            color: #000;
            padding: 10px 24px;
            border-radius: 8px;
            font-family: 'Orbitron', sans-serif;
            font-weight: 700;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s;
        }
        .img-viewer-download:hover {
            box-shadow: 0 0 20px var(--neon-green);
        }

        /* Toast */
        .toast {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%) translateY(100px);
            background: var(--card-bg);
            border: 1px solid var(--neon-green);
            border-radius: 10px;
            padding: 16px 28px;
            color: var(--neon-green);
            font-family: 'Rajdhani', sans-serif;
            font-weight: 600;
            z-index: 3000;
            transition: transform 0.4s ease;
            box-shadow: 0 0 20px rgba(0, 255, 136, 0.2);
        }
        .toast.show { transform: translateX(-50%) translateY(0); }

        /* Scrollbar */
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: #0a0f0a; }
        ::-webkit-scrollbar-thumb { background: var(--neon-green); border-radius: 4px; }

        /* Responsive */
        @media (max-width: 600px) {
            .glitch-title { font-size: 1.8rem; }
            .subtitle { font-size: 1rem; letter-spacing: 2px; }
            .payment-grid { grid-template-columns: 1fr; }
            .student-card { grid-template-columns: 1fr; text-align: center; }
            .student-proof { margin: 0 auto; }
            .student-actions { flex-direction: row; justify-content: center; }
            .admin-nav { justify-content: center; }
            .img-viewer-img { max-width: 95vw; max-height: 60vh; }
            .cursor-circle { display: none; }
            body { cursor: auto; }
            .delete-modal-buttons { flex-direction: column; }
        }
    </style>
</head>
<body>
    <!-- ===== CUSTOM CURSOR CIRCLE ===== -->
    <div class="cursor-circle" id="cursorCircle">
        <div class="cursor-fill"></div>
    </div>

    <div class="bg-lights"></div>
    <div class="light-beam"></div>
    <div class="light-beam"></div>
    <div class="light-beam"></div>
    <div class="light-beam"></div>
    <div class="light-beam"></div>
    <div class="particles" id="particles"></div>

    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1 class="glitch-title" data-text="ERROR IN FOREX">ERROR IN FOREX</h1>
            <p class="subtitle">BY REHMAN ARSHAD</p>
        </div>

        <!-- About Me -->
        <div class="card" style="animation-delay: 0.1s">
            <div class="card-title"><span class="icon">&#128100;</span> ABOUT ME</div>
            <p class="card-text">
                I am <strong style="color: var(--neon-green)">Rehman Arshad</strong>, a professional Forex trader with extensive experience in the financial markets. I have deeply studied and successfully decoded the ICT (Inner Circle Trader) concepts, transforming complex trading principles into a clear and practical approach that traders can easily understand and apply.
            </p>
        </div>

        <!-- Concepts -->
        <div class="card" style="animation-delay: 0.2s">
            <div class="card-title"><span class="icon">&#128202;</span> MY CONCEPTS + EXPERIENCE</div>
            <p class="card-text">
                My concepts are based on <strong style="color: var(--neon-green)">ICT (Inner Circle Trader)</strong> methodology. Through extensive study, practice, and market experience, I have deeply analyzed and decoded ICT concepts, simplifying complex institutional trading principles into a clear and practical approach that traders can easily understand and apply.
            </p>
        </div>

        <!-- Payment Methods -->
        <div class="card" style="animation-delay: 0.3s">
            <div class="card-title"><span class="icon">&#128179;</span> PAYMENT METHODS</div>
            <div class="payment-grid">
                <div class="payment-card">
                    <div class="payment-name">JazzCash</div>
                    <div class="payment-detail label">Number</div>
                    <div class="payment-detail" id="jc-num">03003692731</div>
                    <div class="payment-detail label">Name</div>
                    <div class="payment-detail">IRSHAD HUSSAIN ARSHAD</div>
                    <button class="copy-btn" onclick="copyText('03003692731', this)">&#128203; Copy Number</button>
                </div>
                <div class="payment-card">
                    <div class="payment-name">EasyPaisa</div>
                    <div class="payment-detail label">Number</div>
                    <div class="payment-detail" id="ep-num">03003692731</div>
                    <div class="payment-detail label">Name</div>
                    <div class="payment-detail">IRSHAD HUSSAIN ARSHAD</div>
                    <button class="copy-btn" onclick="copyText('03003692731', this)">&#128203; Copy Number</button>
                </div>
                <div class="payment-card">
                    <div class="payment-name">HBL Account</div>
                    <div class="payment-detail label">Account #</div>
                    <div class="payment-detail" id="hbl-num">01887900426503</div>
                    <div class="payment-detail label">Name</div>
                    <div class="payment-detail">IRSHAD HUSSAIN ARSHAD</div>
                    <button class="copy-btn" onclick="copyText('01887900426503', this)">&#128203; Copy Number</button>
                </div>
                <div class="payment-card">
                    <div class="payment-name">Binance</div>
                    <div class="payment-detail label">UID</div>
                    <div class="payment-detail" id="bin-num">997554750</div>
                    <div class="payment-detail label">Username</div>
                    <div class="payment-detail">Rehman_Arshad_</div>
                    <button class="copy-btn" onclick="copyText('997554750', this)">&#128203; Copy UID</button>
                </div>
            </div>
        </div>

        <!-- Registration Form -->
        <div class="card" style="animation-delay: 0.4s">
            <div class="card-title"><span class="icon">&#128221;</span> REGISTRATION FORM</div>
            <form id="regForm" onsubmit="return false;">
                <div class="form-group">
                    <label class="form-label">NAME</label>
                    <input type="text" class="form-input" id="regName" placeholder="Enter your full name" oninput="checkForm()">
                </div>
                <div class="form-group">
                    <label class="form-label">AGE</label>
                    <input type="number" class="form-input" id="regAge" placeholder="Enter your age" oninput="checkForm()">
                </div>
                <div class="form-group">
                    <label class="form-label">G-MAIL</label>
                    <input type="email" class="form-input" id="regEmail" placeholder="Enter your email address" oninput="checkForm()">
                </div>
                <div class="form-group">
                    <label class="form-label">PHONE NUMBER</label>
                    <input type="tel" class="form-input" id="regPhone" placeholder="Enter your phone number" oninput="checkForm()">
                </div>
                <div class="form-group">
                    <label class="form-label">PAYMENT PROOF (Screenshot)</label>
                    <div class="file-upload" onclick="document.getElementById('regFile').click()">
                        <input type="file" id="regFile" accept="image/*" onchange="handleFile(this)">
                        <div class="file-upload-icon">&#128228;</div>
                        <div class="file-upload-text" id="fileText">Click to upload payment screenshot</div>
                        <img class="file-preview" id="filePreview" alt="Preview">
                    </div>
                </div>
            </form>
        </div>

        <!-- Price & Register Button -->
        <div class="card price-section" style="animation-delay: 0.5s">
            <div class="price-label">FULL TIME MENTORSHIP</div>
            <div class="price-amount">7000 PKR / 25 $</div>
            <button class="register-btn" id="regBtn" disabled onclick="submitRegistration()">
                &#128274; COMPLETE ALL FIELDS TO REGISTER
            </button>
        </div>
    </div>

    <!-- Admin Lock Button -->
    <div class="admin-lock">
        <button class="lock-btn" onclick="openLockModal()" title="Admin Access">&#128274;</button>
    </div>

    <!-- Password Modal -->
    <div class="modal-overlay" id="lockModal">
        <div class="modal">
            <button class="close-modal" onclick="closeLockModal()">&#10005;</button>
            <div class="modal-title">&#128272; ADMIN ACCESS</div>
            <input type="password" class="password-input" id="adminPass" placeholder="ENTER PASSWORD" onkeypress="if(event.key==='Enter')verifyPassword()">
            <button class="modal-btn" onclick="verifyPassword()">UNLOCK</button>
        </div>
    </div>

    <!-- Admin Panel -->
    <div class="admin-panel" id="adminPanel">
        <div class="admin-header">
            <div class="admin-title">&#9889; ADMIN DASHBOARD</div>
            <button class="admin-close" onclick="closeAdmin()">LOGOUT</button>
        </div>
        <div class="admin-nav">
            <button class="admin-tab active" onclick="showTab('pending')">&#9203; Pending Approvals <span id="pendingCount" class="badge badge-pending">0</span></button>
            <button class="admin-tab" onclick="showTab('approved')">&#9989; Students Dashboard <span id="approvedCount" class="badge badge-approved">0</span></button>
            <button class="admin-tab" onclick="showTab('rejected')">&#10060; Rejected <span id="rejectedCount" class="badge badge-rejected">0</span></button>
        </div>
        <div class="admin-content" id="adminContent">
            <!-- Dynamic content -->
        </div>
    </div>

    <!-- ===== DELETE CONFIRMATION MODAL ===== -->
    <div class="delete-modal-overlay" id="deleteModal">
        <div class="delete-modal">
            <div class="delete-modal-icon">&#128683;</div>
            <div class="delete-modal-title">DELETE STUDENT RECORD</div>
            <div class="delete-modal-text">Are you sure you want to permanently delete this student record? This action cannot be undone.</div>
            <div class="delete-modal-student" id="deleteStudentName">Student Name</div>
            <div class="delete-modal-buttons">
                <button class="delete-modal-btn delete-confirm-btn" onclick="confirmDelete()">&#128465; DELETE</button>
                <button class="delete-modal-btn delete-cancel-btn" onclick="closeDeleteModal()">&#10005; CANCEL</button>
            </div>
        </div>
    </div>

    <!-- ===== IMAGE VIEWER MODAL ===== -->
    <div class="img-viewer-overlay" id="imgViewer" onclick="closeImageViewer(event)">
        <div class="img-viewer-box" onclick="event.stopPropagation()">
            <button class="img-viewer-close" onclick="closeImageViewer()">&#10005;</button>
            <img class="img-viewer-img" id="imgViewerImg" src="" alt="Payment Proof">
            <div class="img-viewer-info" id="imgViewerInfo">Student Name - Payment Proof</div>
            <button class="img-viewer-download" id="imgViewerDownload" onclick="downloadImage()">&#128229; Download Screenshot</button>
        </div>
    </div>

    <!-- Toast -->
    <div class="toast" id="toast"></div>

    <script>
        // ===== CUSTOM CURSOR =====
        const cursor = document.getElementById('cursorCircle');
        let mouseX = 0, mouseY = 0;
        let cursorX = 0, cursorY = 0;

        document.addEventListener('mousemove', (e) => {
            mouseX = e.clientX;
            mouseY = e.clientY;
        });

        function animateCursor() {
            cursorX += (mouseX - cursorX) * 0.18;
            cursorY += (mouseY - cursorY) * 0.18;
            cursor.style.left = cursorX + 'px';
            cursor.style.top = cursorY + 'px';
            requestAnimationFrame(animateCursor);
        }
        animateCursor();

        const hoverElements = document.querySelectorAll('a, button, input, .file-upload, .student-proof, .copy-btn, .lock-btn, .admin-tab, .approve-btn, .reject-btn, .delete-btn, .img-viewer-close, .img-viewer-download, .delete-modal-btn');
        hoverElements.forEach(el => {
            el.addEventListener('mouseenter', () => cursor.classList.add('hovering'));
            el.addEventListener('mouseleave', () => cursor.classList.remove('hovering'));
        });

        // Create floating particles
        const particlesContainer = document.getElementById('particles');
        for (let i = 0; i < 30; i++) {
            const p = document.createElement('div');
            p.className = 'particle';
            p.style.left = Math.random() * 100 + '%';
            p.style.animationDelay = Math.random() * 15 + 's';
            p.style.animationDuration = (10 + Math.random() * 10) + 's';
            p.style.width = (2 + Math.random() * 4) + 'px';
            p.style.height = p.style.width;
            particlesContainer.appendChild(p);
        }

        // Data storage - ALL students permanently saved
        let students = JSON.parse(localStorage.getItem('eif_students') || '[]');
        let currentFile = null;
        let currentImageData = '';
        let currentImageName = '';
        let studentToDelete = null;

        // Copy function
        function copyText(text, btn) {
            navigator.clipboard.writeText(text).then(() => {
                btn.innerHTML = '&#9989; Copied!';
                btn.classList.add('copied');
                showToast('Copied to clipboard!');
                setTimeout(() => {
                    btn.innerHTML = '&#128203; Copy Number';
                    btn.classList.remove('copied');
                }, 2000);
            });
        }

        // File handling
        function handleFile(input) {
            if (input.files && input.files[0]) {
                currentFile = input.files[0];
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('filePreview').src = e.target.result;
                    document.getElementById('filePreview').style.display = 'block';
                    document.getElementById('fileText').textContent = currentFile.name;
                };
                reader.readAsDataURL(currentFile);
                checkForm();
            }
        }

        // Form validation
        function checkForm() {
            const name = document.getElementById('regName').value.trim();
            const age = document.getElementById('regAge').value.trim();
            const email = document.getElementById('regEmail').value.trim();
            const phone = document.getElementById('regPhone').value.trim();
            const btn = document.getElementById('regBtn');

            if (name && age && email && phone && currentFile) {
                btn.disabled = false;
                btn.innerHTML = '&#9989; REGISTER NOW';
            } else {
                btn.disabled = true;
                btn.innerHTML = '&#128274; COMPLETE ALL FIELDS TO REGISTER';
            }
        }

        // Submit registration - PERMANENTLY saved
        function submitRegistration() {
            const name = document.getElementById('regName').value.trim();
            const age = document.getElementById('regAge').value.trim();
            const email = document.getElementById('regEmail').value.trim();
            const phone = document.getElementById('regPhone').value.trim();

            const reader = new FileReader();
            reader.onload = function(e) {
                const student = {
                    id: Date.now(),
                    name, age, email, phone,
                    proof: e.target.result,
                    status: 'pending',
                    date: new Date().toLocaleString()
                };
                students.push(student);
                localStorage.setItem('eif_students', JSON.stringify(students));

                // Reset form
                document.getElementById('regForm').reset();
                document.getElementById('filePreview').style.display = 'none';
                document.getElementById('fileText').textContent = 'Click to upload payment screenshot';
                currentFile = null;
                checkForm();

                showToast('&#9989; Registration submitted! Awaiting approval.');
            };
            reader.readAsDataURL(currentFile);
        }

        // Toast
        function showToast(msg) {
            const toast = document.getElementById('toast');
            toast.innerHTML = msg;
            toast.classList.add('show');
            setTimeout(() => toast.classList.remove('show'), 3000);
        }

        // Lock Modal
        function openLockModal() {
            document.getElementById('lockModal').classList.add('active');
            document.getElementById('adminPass').value = '';
            document.getElementById('adminPass').focus();
        }
        function closeLockModal() {
            document.getElementById('lockModal').classList.remove('active');
        }

        // Verify password
        function verifyPassword() {
            const pass = document.getElementById('adminPass').value;
            if (pass === 'Manikhan324671793$') {
                closeLockModal();
                openAdmin();
            } else {
                showToast('&#10060; Incorrect password!');
                document.getElementById('adminPass').value = '';
                document.getElementById('adminPass').style.borderColor = '#ff4444';
                setTimeout(() => {
                    document.getElementById('adminPass').style.borderColor = '';
                }, 1000);
            }
        }

        // Admin Panel
        function openAdmin() {
            document.getElementById('adminPanel').classList.add('active');
            updateCounts();
            showTab('pending');
        }
        function closeAdmin() {
            document.getElementById('adminPanel').classList.remove('active');
        }

        function updateCounts() {
            const pending = students.filter(s => s.status === 'pending').length;
            const approved = students.filter(s => s.status === 'approved').length;
            const rejected = students.filter(s => s.status === 'rejected').length;
            document.getElementById('pendingCount').textContent = pending;
            document.getElementById('approvedCount').textContent = approved;
            document.getElementById('rejectedCount').textContent = rejected;
        }

        function showTab(tab) {
            document.querySelectorAll('.admin-tab').forEach(t => t.classList.remove('active'));
            event.target.classList.add('active');

            const content = document.getElementById('adminContent');
            const filtered = students.filter(s => s.status === tab);

            if (filtered.length === 0) {
                content.innerHTML = `
                    <div class="empty-state">
                        <div class="empty-state-icon">&#128236;</div>
                        <h3 style="color: var(--neon-green); margin-bottom: 10px;">No ${tab} registrations</h3>
                        <p>No students found in this category.</p>
                    </div>
                `;
                return;
            }

            content.innerHTML = filtered.map(s => `
                <div class="student-card">
                    <div class="student-info">
                        <h4>${s.name}</h4>
                        <p>&#128197; ${s.date}</p>
                        <p>&#127874; Age: ${s.age} | &#128231; ${s.email}</p>
                        <p>&#128241; ${s.phone}</p>
                        <span class="badge badge-${s.status}">${s.status}</span>
                    </div>
                    <img src="${s.proof}" class="student-proof" onclick="openImageViewer('${s.proof}', '${s.name}')" title="Click to view full screenshot">
                    <div class="student-actions">
                        ${s.status === 'pending' ? `
                            <button class="approve-btn" onclick="updateStatus(${s.id}, 'approved')">&#9989; Approve</button>
                            <button class="reject-btn" onclick="updateStatus(${s.id}, 'rejected')">&#10060; Reject</button>
                        ` : s.status === 'approved' ? `
                            <button class="reject-btn" onclick="updateStatus(${s.id}, 'rejected')">&#10060; Reject</button>
                        ` : `
                            <button class="approve-btn" onclick="updateStatus(${s.id}, 'approved')">&#9989; Approve</button>
                            <button class="delete-btn" onclick="openDeleteModal(${s.id}, '${s.name}')">&#128465; Delete</button>
                        `}
                    </div>
                </div>
            `).join('');
        }

        function updateStatus(id, status) {
            const s = students.find(x => x.id === id);
            if (s) {
                s.status = status;
                localStorage.setItem('eif_students', JSON.stringify(students));
                updateCounts();
                showToast(status === 'approved' ? '&#9989; Student approved!' : '&#10060; Student rejected!');
                const activeTab = document.querySelector('.admin-tab.active');
                if (activeTab) activeTab.click();
            }
        }

        // ===== DELETE FUNCTIONS =====
        function openDeleteModal(id, name) {
            studentToDelete = id;
            document.getElementById('deleteStudentName').textContent = name;
            document.getElementById('deleteModal').classList.add('active');
        }

        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.remove('active');
            studentToDelete = null;
        }

        function confirmDelete() {
            if (studentToDelete === null) return;

            const studentName = students.find(s => s.id === studentToDelete)?.name || 'Student';

            // Remove student from array permanently
            students = students.filter(s => s.id !== studentToDelete);

            // Save updated array to localStorage
            localStorage.setItem('eif_students', JSON.stringify(students));

            closeDeleteModal();
            updateCounts();
            showToast('&#128465; Student "' + studentName + '" deleted permanently!');

            // Refresh current tab
            const activeTab = document.querySelector('.admin-tab.active');
            if (activeTab) activeTab.click();
        }

        // ===== IMAGE VIEWER FUNCTIONS =====
        function openImageViewer(imageData, studentName) {
            currentImageData = imageData;
            currentImageName = studentName;

            document.getElementById('imgViewerImg').src = imageData;
            document.getElementById('imgViewerInfo').textContent = studentName + ' - Payment Proof Screenshot';
            document.getElementById('imgViewer').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeImageViewer(e) {
            if (!e || e.target.id === 'imgViewer') {
                document.getElementById('imgViewer').classList.remove('active');
                document.body.style.overflow = '';
                currentImageData = '';
                currentImageName = '';
            }
        }

        function downloadImage() {
            if (!currentImageData) return;

            const link = document.createElement('a');
            link.href = currentImageData;
            link.download = 'payment_proof_' + currentImageName.replace(/\s+/g, '_') + '.png';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            showToast('&#128229; Screenshot downloaded!');
        }

        // Close modal on overlay click
        window.onclick = function(e) {
            if (e.target.id === 'lockModal') closeLockModal();
            if (e.target.id === 'deleteModal') closeDeleteModal();
        };

        // Escape key to close modals
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeImageViewer();
                closeLockModal();
                closeDeleteModal();
            }
        });
    </script>
</body>
</html>
