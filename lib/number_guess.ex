defmodule NUMBER_GUESS do
  @moduledoc """
  Documentation for `NUMBER_GUESS`.
  """

  defp get_player_choice do
    choice = IO.gets("Pick a number between 1 and 100:  ") |> Integer.parse
    case choice do
      :error -> IO.puts "Please submit a number"; get_player_choice()
      {low, _} when low < 1 -> IO.puts "Please submit a number between 1 and 100"; get_player_choice()
      {high, _} when high > 100 -> IO.puts "Please submit a number between 1 and 100"; get_player_choice()
      {num, _} -> num
    end
  end

  defp compare_nums(random, guess_count) do
    player_choice = get_player_choice()
    case player_choice - random do
      0 -> IO.puts "Congrats! You guessed the number in #{guess_count} turns"
      too_high when too_high > 0 ->
        IO.puts "That's too high, try again"
        compare_nums(random, guess_count + 1)
      too_low when too_low < 0 ->
        IO.puts "That's too low, try again"
        compare_nums(random, guess_count + 1)
    end
  end

  defp ask_to_continue do
    keep_playing = IO.gets "Would you like to play again? y/n  "
    case String.trim(keep_playing) do
      "y" -> IO.puts "Let's go!"; play_game()
      "n" -> IO.puts "Thanks for playing!"
      _ -> IO.puts "Ummm. I didn't quite get that..."; ask_to_continue()
    end
  end

  def play_game do
    # get random number
    random_num = :rand.uniform(100)

    compare_nums(random_num, 1)

    ask_to_continue()

  end
end

NUMBER_GUESS.play_game()
