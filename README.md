# Tap Tap Game 🎮

**A fun pixel-based tap-to-jump game**

## Game Features

- ✅ **Tap to Jump** - Simple one-hand gameplay
- ✅ **Retro 8-bit Pixel Graphics** - Nostalgic style with red player and blue obstacles
- ✅ **Progressive Difficulty** - Game gets harder every 10 points
- ✅ **Obstacle Avoidance** - Dodge incoming obstacles
- ✅ **Score System** - Compete for high scores
- ✅ **Level Progression** - Reach new levels as you score

## How to Play

1. **Tap/Click** to make the player jump
2. **Avoid obstacles** coming from the right side
3. **Survive as long as possible** to increase your score
4. Every **10 points = 1 level** increase (game gets faster)
5. **Game Over** when you hit an obstacle or fall off screen
6. **Tap to Restart** after game over

## Installation

### Prerequisites
- [Godot Engine 3.5+](https://godotengine.org/download) (FREE)

### Steps

1. Clone this repository:
```bash
git clone https://github.com/ravanharishravan-sketch/tap-tap-game.git
cd tap-tap-game
```

2. Open in Godot Engine:
   - Launch Godot
   - Click "Open" project
   - Select the `tap-tap-game` folder
   - Double-click `project.godot`

3. Play:
   - Click "Play" button (F5) to start
   - Tap/Click to jump
   - Avoid obstacles!

## Game Mechanics

### Player
- **Red pixel character** at the bottom
- Tap/Click to jump upward
- Falls due to gravity
- Game ends if hits obstacle or falls off bottom

### Obstacles
- **Blue pixel spikes** come from the right side
- Move left across the screen
- Speed increases with each level
- Spawn more frequently as difficulty increases

### Difficulty Progression
- **Level 1 (0-10 points):** Slow obstacles, easy spawning
- **Level 2 (10-20 points):** Faster obstacles, quicker spawning
- **Level 3+ (20+ points):** Very fast, intense gameplay!

## Score System

- **+10 Points** for each obstacle successfully avoided
- **Level Up** every 10 points gained
- **Game Over** displays final score

## File Structure

```
tap-tap-game/
├── project.godot           # Project configuration
├── scenes/
│   ├── Main.tscn          # Main game scene
│   └── Obstacle.tscn      # Obstacle scene
├── scripts/
│   ├── GameManager.gd     # Game logic & score tracking
│   ├── Player.gd          # Player movement & controls
│   ├── Obstacle.gd        # Obstacle behavior
│   └── ObstacleSpawner.gd # Spawn management & difficulty
└── README.md
```

## Controls

- **TAP / CLICK / SPACEBAR** - Jump
- **TAP / CLICK** (Game Over) - Restart

## Technical Details

- **Engine:** Godot 3.5+
- **Language:** GDScript
- **Resolution:** 540x960 (Mobile optimized)
- **Physics:** 2D with custom gravity
- **Graphics:** Retro 8-bit pixel style (programmatically drawn)

## How to Build APK

1. In Godot Editor:
   - Go to **Project > Export**
   - Click **Add Platform > Android**
   - Configure Android SDK path
   - Click **Export Project**
   - Select location to save APK

2. Transfer APK to your phone and install!

## Future Enhancements

- [ ] Sound effects & background music
- [ ] Power-ups (shield, slow-mo)
- [ ] High score leaderboard
- [ ] Different character skins
- [ ] Particle effects
- [ ] More obstacle types
- [ ] Pause menu
- [ ] Settings (difficulty, graphics)

## License

MIT License - Feel free to use and modify!

## Author

Created with ❤️ using Godot Engine

---

**Enjoy playing Tap Tap! 🎮✨**

Have fun and challenge your friends for the highest score!
