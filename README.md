## KommuLink

Safe insurance for you to chat with others on any `IM` tools.

#### Prerequisites

* Ruby 2.2.3 or later
* Local OpenSSL support (which should originally be there)
* A Friend of **yours**

#### How to use

0. Find someone who would like to chat with you in an `encrypted manner`

0. Decides who to be the active one (like `servers` in `SSL`) and who to be the passive on (the same, like `clients`)

0. Run `ruby main.rb`， and you will see the welcome screen

   ```
   Welcome use :
   
   <ASCII art>
   
   Test version, do not distribute
   
   Select Communication Mode :
    1) Active
    2) Passive
   ```

0. Select `1` for active mode and `2` for passive mode

0. Follow the instruction to send the key exchange data between users and

0. After completing key exchange, you'll see a line reads `Key exchange finished, start chatting !`

0. Type in your message to get it encrypted, or type in the encrypted message your friend sends you to decrypt it

#### Crypto-Spec

Key exchange was completed under `RSA 2048`, which is theoretically safe for short-term use. The messages after key exchange will be encrypted with `AES 256 CBC`.

No digest verification (which might~~?~~ be added later) and no complicated handshake procedure was designed, just for temporary use.