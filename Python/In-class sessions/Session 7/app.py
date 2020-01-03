from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/listing')
def listing():
	mylist=['item1', 'item2', 'item3']
	return render_template('list.html', listing=mylist)


@app.route('/profile/<name>')
def profile(name):
	return render_template("profile.html", name=name)

@app.route('/')
def index():
    if request.method == 'GET':
        return 'Method used: {}'.format(request.method)
    elif request.method == 'POST':
        return 'Method used: {}'.format(request.method)

@app.route('/login', methods=['GET','POST'])
def login():
    if request.method == 'GET':
        return ''' It is a GET state:
            <form method='POST'>
            Username: <input type="text" name="Username"> <br>
            Password: <input type="text" name="Password"> <br>
            <input type="submit" value="Submit"> <br>
            </form>'''
    elif request.method == 'POST':
        return 'Method used: {}'.format(request.method)
    
if __name__=="__main__":
#     app.run()
    app.run(debug=True)
