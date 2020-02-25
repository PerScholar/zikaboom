require 'ruby2d'

set title: 'ZikaBoom', background: 'brown', width: 220, height: 60

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

on :mouse_down do |event|
  song = Music.new('song.mp3')
  song.volume = 50
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

on :mouse_move do |event|
  if event.x.between?(0,49) && event.y.between?(5,55)
    if play.z == 10
      play.opacity = 1
      resume.opacity = 0.5
      pause.opacity = 0.5
      stop.opacity = 0.5
    else
      play.opacity = 0.5
      resume.opacity = 1
      pause.opacity = 0.5
      stop.opacity = 0.5
    end
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


show
