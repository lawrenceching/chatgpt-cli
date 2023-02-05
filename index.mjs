// import dotenv from 'dotenv-safe'
import {oraPromise} from 'ora'

import {ChatGPTAPI} from 'chatgpt'
import prompts from 'prompts'


// dotenv.config()

(async function () {
    const api = new ChatGPTAPI({apiKey: process.env.OPENAI_API_KEY})
    const debug = process.env.DEBUG === 'true'

    while (true) {
        const response = await prompts({
            type: 'text',
            name: 'value',
            message: 'Question: '
        });

        const question = response.value;

        if(question === undefined) {
            // User press Ctrl+C when prompted
            break;
        }

        if(question.trim().length ===0) {
            continue
        }

        const res = await oraPromise(api.sendMessage(question), {
            text: question
        })

        if (debug)
            console.log(res);
        else
            console.log(res.text);
        console.log();
    }

})();

