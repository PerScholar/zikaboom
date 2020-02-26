require 'ruby2d'

def play(song)
  song = Music.new(song)
  song.volume = 50
  Window.set title: 'ZikaBoom', background: 'brown', width: 220, height: 60

  play = Image.new(
    'play.png',
    x: 5, y: 5,
    width: 50, height: 50,
    opacity: 0.5,
    z: 10
  )

  resume = Image.new(
    'resume.png',
    x: 115, y: 5,
    width: 50, height: 50,
    opacity: 0.5,
    z: 10
  )

  bg = Image.new(
    'bg.jpg',
    x: 0, y: 0,
    width: 220, height: 60,
    opacity: 1,
    z: 1
  )

  pause = Image.new(
    'pause.png',
    x: 60, y: 5,
    width: 50, height: 50,
    opacity: 0.5,
    z: 10
  )

  stop = Image.new(
    'stop.png',
    x: 170, y: 5,
    width: 50, height: 50,
    opacity: 0.5,
    z: 10
  )

  Window.on :mouse_down do |event|
    if event.x.between?(0,49) && event.y.between?(5,55)
        song.play
    elsif event.x.between?(50,99) && event.y.between?(5,55)
      song.pause
    elsif event.x.between?(100,149) && event.y.between?(5,55)
      song.resume
    elsif event.x.between?(150,200) && event.y.between?(5,55)
      song.stop
    end
  end

  Window.on :mouse_move do |event|
    if event.x.between?(0,49) && event.y.between?(5,55)
        play.opacity = 1
        resume.opacity = 0.5
        pause.opacity = 0.5
        stop.opacity = 0.5
    elsif event.x.between?(50,99) && event.y.between?(5,55)
      pause.opacity = 1
      play.opacity = 0.5
      resume.opacity = 0.5
      stop.opacity = 0.5
    elsif event.x.between?(100,149) && event.y.between?(5,55)
      resume.opacity = 1
      play.opacity = 0.5
      stop.opacity = 0.5
      pause.opacity = 0.5
    elsif event.x.between?(150,200) && event.y.between?(5,55)
      stop.opacity = 1
      play.opacity = 0.5
      resume.opacity = 0.5
      pause.opacity = 0.5
    end
  end

  Window.show

end

song = 'song.mp3'
play(song)
