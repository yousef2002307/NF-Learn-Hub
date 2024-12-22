
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    
</body>
<script>
    const token = 'Bearer 405|bj649iYo7RPHWEd9S2TsAPQAs8XtgcyeULSVeVHK32d15057';
const questions = [
    { is_correct: true, answer_text: "Answer 11", question_id: 10 },
    { is_correct: false, answer_text: "Answer 21", question_id: 10 },
    { is_correct: true, answer_text: "Answer 11", question_id: 9 },
    { is_correct: false, answer_text: "Answer 21", question_id: 9 }
];

for (let question of questions) {
    fetch('/api/v1/ans', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify({
            is_correct: question.is_correct,
            answer_text: question.answer_text,
            question_id: question.question_id
        })
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
   

   
</script>
</html>
{{-- <!DOCTYPE html>
<html>
<head>
    <title>Redirecting...</title>
</head>
<body>
    <p>password resete successfuly, you will be redirected after 5 seconeds.</p>
    <script>
        setTimeout(function() {
            window.location.href = "/"; // Replace "/" with your desired redirect URL
        }, 5000); // 5000 milliseconds = 5 seconds
    </script>
</body>
</html> --}}