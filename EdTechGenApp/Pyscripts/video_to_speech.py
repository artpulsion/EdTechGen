
# This function extract the audio sound from a video, 
# create a configuration files with the context of 
# the videos and create a structure of folders for
# the next processing.


import glob
import subprocess

def VideoToSpeech():

  upload_directory = "/home/sofianembarki/Desktop/Projects/EdTechGen/resources/upload/"
  audio_destination = "/home/sofianembarki/Desktop/Projects/EdTechGen/resources/output/audios/"
  videos_to_process = glob.glob(upload_directory + "*.mp4")
  
  for element in videos_to_process:

    # get the last "/" to get the title
    index_title = element.rfind('/') + 1
    
    # create the audio title
    audio_name = element[index_title:].replace('.mp4', '.wav').lower()
    
    # create a directory for the current video
    command_create_dir =  "mkdir " + audio_destination + audio_name.split(".wav")[0]
    subprocess.call(command_create_dir, shell=True)

		# extract audio in .wav, if stereo change config to mono and then convert it to .flac
    current_audio_destination =  audio_destination + audio_name.split(".wav")[0] + "/" + audio_name
    command_extract = "ffmpeg -i {} -ab 160k -ac 1 -ar 44100 -vn {}".format(element, current_audio_destination.split(".wav")[0] + ".flac")
    subprocess.call(command_extract, shell=True)

    # create a configuration file for the current audio
    current_yaml_destination = audio_destination + audio_name.split(".wav")[0] 
    command_yaml = 'echo "language:\nkeywords:\n" >> {}/context.yaml'.format(current_yaml_destination)
    subprocess.call(command_yaml, shell=True)
    
    # move the video to the processed folder
    command_move_video = "mv " + element + " " + element.replace( "upload", "processed")
    subprocess.call(command_move_video, shell=True)
    
  return "Done."
