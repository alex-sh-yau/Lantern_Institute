from flask import Flask, request, render_template

app = Flask(__name__)

itemlist={"Living Room Light": "On", 
          "Dining Room Light": "On", 
          "Bedroom Light": "On",
          "Bathroom Light": "On"}

@app.route('/status')
def listing():
	return render_template('status.html', listing=itemlist)


@app.route('/result', methods = ['POST','GET'])
def status():
	if request.method == 'POST':
		try:
			query = request.form
			if 'Status' in query:
				status = itemlist[query['Status']]
			elif 'Change' in query:
				if itemlist[query['Change']] == 'On':
					itemlist[query['Change']] = 'Off'
				elif itemlist[query['Change']] == 'Off':
					itemlist[query['Change']] = 'On'
				else:
					itemlist[query['Change']] = 'Invalid'
				status = itemlist[query['Change']]
			else:
				status = 'Invalid'
		except:
			query = {"Error": "Please enter a valid light in the list"}
			status = query['Error']
		return render_template('result.html', listing=itemlist, status=status, query=query)

if __name__=="__main__":
#     app.run()
    app.run(debug=True)
