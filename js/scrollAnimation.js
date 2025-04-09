export function setupScrollAnimations() {
    gsap.registerPlugin(ScrollTrigger);

    gsap.utils.toArray(".console-card").forEach(card => {
        gsap.from(card, {
            opacity: 0,
            scale: 0.5,
            y: 100,
            duration: 0.8,
            ease: "back.out(1.7)", 
            scrollTrigger: {
                trigger: card,
                start: "top 85%",
                toggleActions: "play none none none"
            }
        });
    });
}
