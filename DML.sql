--What is the playlist for the top 10 most popular songs?
SELECT TOP 10 * 
FROM [XStreamLee.Song]
ORDER BY sngNoStreams DESC

-- What are the number of listeners that are using the basic plan?
SELECT COUNT(o.lsnId)
FROM [XStreamLee.Own] o 
WHERE o.plnId = (
	SELECT p.plnId
	FROM [XstreamLee.Plan] p
	WHERE p.planType = 'Basic')

SELECT * FROM [XStreamLee.Own]

-- What are the number of listeners who listen to songs other than there chosen language?
SELECT COUNT(lsnId) * 100 / (SELECT COUNT(l1.lsnId) FROM [XstreamLee.Listener] l1) AS 'Percentage of Listeners listening to songs other than preferred language' 
FROM [XstreamLee.Listener] l
WHERE l.lsnId IN (
	SELECT li.lsnId
	FROM [XStreamLee.Listen] li
	WHERE li.sngId IN (
		SELECT s.sngId
		FROM [XStreamLee.Song] s
		WHERE s.sngLanguage != l.lsnLanguage))


-- What is the most popular band for each genre, for genre having bands?
SELECT a.*
FROM [XStreamLee.Artist] a
WHERE a.artFollowers IN (
	SELECT MAX(a1.artFollowers)
	 FROM [XStreamLee.Artist] a1
	 WHERE a1.artMembers > 1
	 GROUP BY a1.gnrId)
